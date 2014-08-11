
#ifndef TXR_JADE_H
#define TXR_JADE_H

typedef enum jade_valtype{
	TYPE_BOOL = 0,
	TYPE_INT,
	TYPE_FLOAT,
	TYPE_STR
} jade_valtype;

typedef struct {
	union {
		int ival;
		double fval;
		struct str {
			char *p;
			size_t sz;
		};
	} value;
	jade_valtype type;
} jade_value;
#define JADE_TYPE(v) (v.jade_valtype)

#define SET_INT_VAL(v,i) do { \
	JADE_TYPE(v) = TYPE_INT;\
	v.value.ival = i;\
} while(0)
#define SET_FLOAT_VAL(v,f) do { \
	JADE_TYPE(v) = TYPE_FLOAT;\
	v.value.fval = f;\
} while(0)
#define SET_STR_VAL(v,str,sz) do { \
	JADE_TYPE(v) = TYPE_STR;\
	v.value.str.p = str;\
	v.value.str.sz = sz;\
} while(0)
#define SET_FALSE_VAL(v) do { \
	JADE_TYPE(v) = TYPE_BOOL;\
	v.value.ival = 0;\
} while(0)
#define SET_TRUE_VAL(v) do { \
	JADE_TYPE(v) = TYPE_BOOL;\
	v.value.ival = 1;\
} while(0)

static inline 
jade_value jade_int_val(int i)
{
	jade_value v;
	SET_INT_VAL(v,i);
	return v;
}

static inline
jade_value jade_float_val(double f)
{
	jade_value v;
	SET_FLOAT_VAL(v,f);
	return v;
}

static inline
jade_value jade_true_val()
{
	jade_value v;
	SET_TRUE_VAL(v);
	return v;
}

static inline
jade_value jade_false_val()
{
	jade_value v;
	SET_FALSE_VAL(v);
	return v;
}

jade_value jade_str_new(const char *p,size_t sz)
{
	char *str = (char *)malloc(sz+1);
	memcpy(str,p,sz);
	jade_value *jv = malloc(*jv);
	memset(jv,0,sizeof(*jv));
	SET_STR_VALUE(*jv);
	return *jv;
}

#endif
