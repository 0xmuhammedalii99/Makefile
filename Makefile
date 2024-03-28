# [Author] 			: Muhammed Ali Ibrahim Ahmed 
# [Descreption] 	: Makefile to built any Embedded Project
# [LinkedIn]		: 
# [Data]			: 24 February , 2024

#    	-------------------------------------- Variables --------------------------------------

# [ Descreption ]	: To Abstract Your Compiler
COMPILER=arm
# [ Descreption ]	: Collect Your Common Flags
FLAGS=-Wall -c -mcpu=cortex-m4 -mthumb
# [ Descreption ]	: All Includes Folders
INCS= -I .
# [ Descreption ]	: Include all External Libraries
LIBS=
# [ Descreption ]	: Collect All .c Files ( Source )
SRC=$(wildcard *.c)
# [ Descreption ]	: Make a Copy name From any .c to .o 
OBJ=$(SRC:.c=.o)
# [ Descreption ]	: Collect all .s Files ( Assembly )
ASMSRC=$(wildcard *.s)
# [ Descreption ]	: Make a Copy name From any .s to .o 
ASMOBJ=$(SRC:.s=.o)
# [ Descreption ]	: Project Name
PROJECTNAME=FinalProject



#    	-------------------------------------- Targets --------------------------------------
all : FinalProject.bin
	@echo "---------------- Build is Done ----------------"

#STM32F401xCTx_Startup.o : STM32F401xCTx_Startup.c
#$(COMPILER)-gcc -E  $(FLAGS) $< $(INCS)  -o $@

%.o : %.c
	$(COMPILER)-gcc  $(FLAGS) $< $(INCS)  -o $@

$(PROJECTNAME).elf : $(OBJ)
	$(COMPILER)-ld $(OBJ) $(LIBS) -o FinalProject.elf -T STM32F401xCTx_LinkerScript.ld

$(PROJECTNAME).bin : $(PROJECTNAME).elf
	$(COMPILER)-objcopy -O binary $< $@

clean:
	rm *.o *.elf *.bin

help :
	@echo The following are some of the valid targets for this Makefile:
	@echo ... all	 :  	Default Target PROJECTNAME.bin
	@echo ... clean	 :		Clean all .o .elf .bin	
	@echo ------------ By Muhammed Ali ------------
