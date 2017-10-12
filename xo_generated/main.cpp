/*******************************************************************************
Vendor: Xilinx 
Associated Filename: test-cl.c
Purpose: OpenCL Host Code for Matrix Multiply Example
Revision History: July 1, 2013 - initial release
                                                
*******************************************************************************
Copyright (C) 2013 XILINX, Inc.

This file contains confidential and proprietary information of Xilinx, Inc. and 
is protected under U.S. and international copyright and other intellectual 
property laws.

DISCLAIMER
This disclaimer is not a license and does not grant any rights to the materials 
distributed herewith. Except as otherwise provided in a valid license issued to 
you by Xilinx, and to the maximum extent permitted by applicable law: 
(1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX 
HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR 
FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether 
in contract or tort, including negligence, or under any other theory of 
liability) for any loss or damage of any kind or nature related to, arising under 
or in connection with these materials, including for any direct, or any indirect, 
special, incidental, or consequential loss or damage (including loss of data, 
profits, goodwill, or any type of loss or damage suffered as a result of any 
action brought by a third party) even if such damage or loss was reasonably 
foreseeable or Xilinx had been advised of the possibility of the same.

CRITICAL APPLICATIONS
Xilinx products are not designed or intended to be fail-safe, or for use in any 
application requiring fail-safe performance, such as life-support or safety 
devices or systems, Class III medical devices, nuclear facilities, applications 
related to the deployment of airbags, or any other applications that could lead 
to death, personal injury, or severe property or environmental damage 
(individually and collectively, "Critical Applications"). Customer assumes the 
sole risk and liability of any use of Xilinx products in Critical Applications, 
subject only to applicable laws and regulations governing limitations on product 
liability. 

THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT 
ALL TIMES.

*******************************************************************************/
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <unistd.h>
#include <assert.h>
#include <stdbool.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <CL/opencl.h>
#include <CL/cl.h>

/*
			Given an event, this function returns the kernel execution time in ms
			*/
			float getTimeDifference(cl_event event) {
				cl_ulong time_start = 0;
				cl_ulong time_end = 0;
				float total_time = 0.0f;

				clGetEventProfilingInfo(event,
					CL_PROFILING_COMMAND_START,
					sizeof(time_start),
					&time_start,
					NULL);
				clGetEventProfilingInfo(event, 
					CL_PROFILING_COMMAND_END,
					sizeof(time_end),
					&time_end,
					NULL);
				total_time = time_end - time_start;
				return total_time/ 1000000.0; // To convert nanoseconds to milliseconds
			}


int
load_file_to_memory(const char *filename, char **result)
{ 
  int size = 0;
  FILE *f = fopen(filename, "rb");
  if (f == NULL) 
  { 
    *result = NULL;
    return -1; // -1 means file opening fail 
  } 
  fseek(f, 0, SEEK_END);
  size = ftell(f);
  fseek(f, 0, SEEK_SET);
  *result = (char *)malloc(size+1);
  if (size != fread(*result, sizeof(char), size, f)) 
  { 
    free(*result);
    return -2; // -2 means file reading fail 
  } 
  fclose(f);
  (*result)[size] = 0;
  return size;
}

int main(int argc, char** argv)
{
	printf("starting HOST code \n");
	fflush(stdout);
  int err;                            // error code returned from api calls
     
	unsigned int * a = (unsigned int *)malloc(sizeof(unsigned int) * 16);
	unsigned int * b = (unsigned int *)malloc(sizeof(unsigned int) * 16);
	unsigned int * out = (unsigned int *)malloc(sizeof(unsigned int) * 16);

	printf("array defined! \n");
	
	fflush(stdout);

  cl_platform_id platform_id;         // platform id
  cl_device_id device_id;             // compute device id 
  cl_context context;                 // compute context
  cl_command_queue commands;          // compute command queue
  cl_program program;                 // compute program
  cl_kernel kernel;                   // compute kernel
   
  char cl_platform_vendor[1001];
  char cl_platform_name[1001];
   
  cl_mem input_a ;                     // device memory used for the input array
  cl_mem input_b ;                     // device memory used for the input array
  cl_mem out_buff;
   
  if (argc != 2){
    printf("%s <inputfile>\n", argv[0]);
    return EXIT_FAILURE;
  }

  // Fill our data sets with pattern
  //
  int i = 0;
	for(i = 0; i < 16; i++) a[i] = 0;
	for(i = 0; i < 16; i++) b[i] = 0;
	for(i = 0; i < 16; i++) out[i] = 0;

	
	fflush(stdout);



  // Connect to first platform
  //
	printf("GET platform \n");
  err = clGetPlatformIDs(1,&platform_id,NULL);
  if (err != CL_SUCCESS)
  {
    printf("Error: Failed to find an OpenCL platform!\n");
    printf("Test failed\n");
    return EXIT_FAILURE;
  }
	printf("GET platform vendor \n");
  err = clGetPlatformInfo(platform_id,CL_PLATFORM_VENDOR,1000,(void *)cl_platform_vendor,NULL);
  if (err != CL_SUCCESS)
  {
    printf("Error: clGetPlatformInfo(CL_PLATFORM_VENDOR) failed!\n");
    printf("Test failed\n");
    return EXIT_FAILURE;
  }
  printf("CL_PLATFORM_VENDOR %s\n",cl_platform_vendor);
	printf("GET platform name \n");
  err = clGetPlatformInfo(platform_id,CL_PLATFORM_NAME,1000,(void *)cl_platform_name,NULL);
  if (err != CL_SUCCESS)
  {
    printf("Error: clGetPlatformInfo(CL_PLATFORM_NAME) failed!\n");
    printf("Test failed\n");
    return EXIT_FAILURE;
  }
  printf("CL_PLATFORM_NAME %s\n",cl_platform_name);
 
  // Connect to a compute device
  //
  int fpga = 0;
#if defined (FPGA_DEVICE)
  fpga = 1;
#endif
	printf("get device, fpga is %d \n", fpga);
  err = clGetDeviceIDs(platform_id, fpga ? CL_DEVICE_TYPE_ACCELERATOR : CL_DEVICE_TYPE_CPU,
                       1, &device_id, NULL);
  if (err != CL_SUCCESS)
  {
    printf("Error: Failed to create a device group!\n");
    printf("Test failed\n");
    return EXIT_FAILURE;
  }
  
  // Create a compute context 
  //
	printf("create context \n");
  context = clCreateContext(0, 1, &device_id, NULL, NULL, &err);
  if (!context)
  {
    printf("Error: Failed to create a compute context!\n");
    printf("Test failed\n");
    return EXIT_FAILURE;
  }

  // Create a command commands
  //
	printf("create queue \n");
  commands = clCreateCommandQueue(context, device_id, CL_QUEUE_PROFILING_ENABLE, &err);
  if (!commands)
  {
    printf("Error: Failed to create a command commands!\n");
    printf("Error: code %i\n",err);
    printf("Test failed\n");
    return EXIT_FAILURE;
  }

  int status;

  // Create Program Objects
  //
  
  // Load binary from disk
  unsigned char *kernelbinary;
  char *xclbin=argv[1];
  printf("loading %s\n", xclbin);
  int n_i = load_file_to_memory(xclbin, (char **) &kernelbinary);
  if (n_i < 0) {
    printf("failed to load kernel from xclbin: %s\n", xclbin);
    printf("Test failed\n");
    return EXIT_FAILURE;
  }
  size_t n = n_i;
  // Create the compute program from offline
	printf("create program with binary \n");
  program = clCreateProgramWithBinary(context, 1, &device_id, &n,
                                      (const unsigned char **) &kernelbinary, &status, &err);
  if ((!program) || (err!=CL_SUCCESS)) {
    printf("Error: Failed to create compute program from binary %d!\n", err);
    printf("Test failed\n");
    return EXIT_FAILURE;
  }

  // Build the program executable
  //
	printf("build program \n");
  err = clBuildProgram(program, 0, NULL, NULL, NULL, NULL);
  if (err != CL_SUCCESS)
  {
    size_t len;
    char buffer[2048];

    printf("Error: Failed to build program executable!\n");
    clGetProgramBuildInfo(program, device_id, CL_PROGRAM_BUILD_LOG, sizeof(buffer), buffer, &len);
    printf("%s\n", buffer);
    printf("Test failed\n");
    return EXIT_FAILURE;
  }

  // Create the compute kernel in the program we wish to run
  //
	printf("create kernel \n");
  kernel = clCreateKernel(program, "AdderAxi", &err);
  if (!kernel || err != CL_SUCCESS)
  {
    printf("Error: Failed to create compute kernel!\n");
    printf("Test failed\n");
    return EXIT_FAILURE;
  }

	printf("create buffer 0 \n");
  input_a = clCreateBuffer(context,  CL_MEM_READ_ONLY ,  sizeof(unsigned int) * 16, NULL, NULL);
	printf("create buffer 1 \n");
  input_b = clCreateBuffer(context,  CL_MEM_READ_ONLY ,  sizeof(unsigned int) * 16, NULL , NULL);
	printf("create buffer 2 \n");
  out_buff = clCreateBuffer(context, CL_MEM_READ_WRITE, sizeof(unsigned int)* 16, NULL, NULL);
  
if (!input_a || !input_b || !out_buff) 
  {
    printf("Error: Failed to allocate device memory!\n");
    printf("Test failed\n");
    return EXIT_FAILURE;
  }    
    
  // Set the arguments to our compute kernel
  
  err = 0;
	printf("set arg 0 \n");
  err  = clSetKernelArg(kernel, 0, sizeof(cl_mem), &input_a);
  if (err != CL_SUCCESS)
  {
    printf("Error: Failed to set kernel arguments 0! %d\n", err);
    printf("Test failed\n");
    return EXIT_FAILURE;
  }
	printf("set arg 1 \n");
  err |= clSetKernelArg(kernel, 1, sizeof(cl_mem), &input_b);
  if (err != CL_SUCCESS)
  {
    printf("Error: Failed to set kernel arguments 1! %d\n", err);
    printf("Test failed\n");
    return EXIT_FAILURE;
  }
	printf("set arg 2 \n");
  err |= clSetKernelArg(kernel, 2, sizeof(cl_mem), &out_buff);
  if (err != CL_SUCCESS)
  {
    printf("Error: Failed to set kernel arguments 2! %d\n", err);
    printf("Test failed\n");
    return EXIT_FAILURE;
  }

cl_event enqueue_kernel;
	printf("LAUNCH task \n");
  err = clEnqueueTask(commands, kernel, 0, NULL, &enqueue_kernel);
  if (err)
  {
    printf("Error: Failed to execute kernel! %d\n", err);
    printf("Test failed\n");
    return EXIT_FAILURE;
  }
	printf("enqueued, waiting to end computation\n");
	fflush(stdout);
  clWaitForEvents(1, &enqueue_kernel);
	printf("computation ended\n");
	fflush(stdout);

  // Read back the results from the device to verify the output
  //
  cl_event readevent;
	printf("read buffer \n");
  err = clEnqueueReadBuffer( commands, out_buff, CL_TRUE, 0, sizeof(unsigned int) * 16, out, 0, NULL, &readevent );  
  if (err != CL_SUCCESS)
  {
    printf("Error: Failed to read output array! %d\n", err);
    printf("Test failed\n");
    return EXIT_FAILURE;
  }

  clWaitForEvents(1, &readevent);

	float executionTime = getTimeDifference(enqueue_kernel); 
	
	    
	printf(" execution time is %f ms\n", executionTime);
    
  // Print a brief summary detailing the results
  //
  printf("computation ended!- RESULTS CORRECT \n");
    
  // Shutdown and cleanup
  //
  clReleaseMemObject(input_a);
  clReleaseMemObject(input_b);
  clReleaseMemObject(out_buff);
  clReleaseProgram(program);
  clReleaseKernel(kernel);
  clReleaseCommandQueue(commands);
  clReleaseContext(context);

  return EXIT_SUCCESS;
}
