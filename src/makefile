##########################

LIBNAME := lisp

SRCS := lisp.bas 
SRCS += lisp_int.bas 
SRCS += lisp_ctx.bas 
SRCS += lisp_lexer.bas 
SRCS += lisp_object.bas 
SRCS += lisp_objects.bas 
SRCS += lisp_parser.bas 
SRCS += lisp_funcs.bas
SRCS += lisp_eval.bas
SRCS += lisp_runtime_console.bas
SRCS += lisp_runtime_data.bas
SRCS += lisp_runtime_list.bas
SRCS += lisp_runtime_math.bas
SRCS += lisp_runtime_prog.bas
SRCS += lisp_runtime_system.bas

HDRS := $(wildcard *.bi) $(wildcard ../inc/lisp_*.bi)

OBJS := $(patsubst %.bas,obj/%.o,$(SRCS))

##########################

FBC := fbc
FBCFLAGS := -i ../inc

ifdef DEBUG
FBCFLAGS += -g -d DEBUG -w pedantic -exx
endif

.SUFFIXES:
.SUFFIXES: .bas .bi

VPATH = .

##########################

all: ../lib/lib$(LIBNAME).a

obj/%.o : %.bas $(HDRS)
	$(FBC) $(FBCFLAGS) -c $< -o $@

../lib/lib$(LIBNAME).a: $(OBJS)
	$(FBC) -lib $(FBCFLAGS) $(OBJS) $(LIBS) $(RCS) -x ../lib/lib$(LIBNAME).a

.PHONY : clean
clean:
	-rm -f $(OBJS) $(APP)
