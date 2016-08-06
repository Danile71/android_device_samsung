/* cpucontrol.c */
/* by Danil_e71*/
/*    Copyright 2009, 2010 10gen Inc.
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */
#define LOG_TAG "cpucontrol_android"
#include "cpucontrol.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <time.h>
#include <cutils/log.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>





static void millisleep(unsigned long millisec) {
   struct timespec req = {
      .tv_sec = 0,
      .tv_nsec = millisec * 1000000L
   };
   while(nanosleep(&req,&req)==-1) {
      continue;
   }
}

char *read_f(char *f)
{
char size[64];
int fd, ret;
fd = open(f, O_RDONLY);
if (fd < 0)return ERROR;
ret = read(fd, size, sizeof(size));
close(fd);
if (ret <= 0)return ERROR;
return size;
} 
void write_f(char *f,char *data)
{
int fd;
fd = open(f,  O_RDWR);

if (fd >=0)
write(fd, data, strlen(data));
close(fd);
} 







int cpu[4];
int timeout;
int min_cpu;
int i;
int current_freq;
char file[128];






void set_kgsl(int max)
{
if(max)write_f("/sys/class/kgsl/kgsl-3d0/wake_timeout","100");
else write_f("/sys/class/kgsl/kgsl-3d0/wake_timeout","500");
}



void set_min_freq(char *freq)
{
write_f("/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq",freq);
}

void get_online()
{

for(i=0;i<4;i++)
{
sprintf(file,"/sys/devices/system/cpu/cpu%d/online",i);
cpu[i]=atoi(read_f(file));
}
current_freq=atoi(read_f(CPU_FILE));
if(!strstr(read_f("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"),"smartassV2"))
write_f("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor","smartassV2");
}


void disable()
{

for(i=3;i>min_cpu;i--)
{
if(cpu[i]==1)
{
sprintf(file,"/sys/devices/system/cpu/cpu%d/online",i);
write_f(file,"0");
cpu[i]=0;
break;
}
}
}


void enable()
{
for(i=1;i<4;i++)
{
if(cpu[i]==0)
{
sprintf(file,"/sys/devices/system/cpu/cpu%d/online",i);
write_f(file,"1");
cpu[i]=1;
break;
}
}
}


int main()
{
char *mode;
timeout=300;
min_cpu=1;
set_min_freq("533333");


while(1)
{
mode=read_f(STATUS_FILE);

if(mode[0]=='s' && timeout == 300)
{
set_min_freq("400000");
timeout=500;
min_cpu=0;
set_kgsl(0);
}
else
if(mode[0]=='a' &&  timeout == 500)
{
set_min_freq("533333");
timeout=300;
min_cpu=1;
set_kgsl(1);
}

get_online();

if(current_freq<=533333)
disable();
else if(current_freq>1000000)
enable();

millisleep(timeout);
}

return 1;


}

