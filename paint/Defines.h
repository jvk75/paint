// debug message
#define DMSG(M)
#ifdef DEBUG
#define DMSG(M) NSLog(@"%@ -> %s:%d",M,__FILE__,__LINE__)
#else
#endif

// Helper: NSInteger to NSNumber
#define i2n(N) [NSNumber numberWithInteger:N]

// for test handler
#define kNUMBEROFCASESROW 0

// for test cases
#define kNUMBEROFCOLORSROW 0
#define kNUMBEROFCUSTOMERSROW 1
#define kFIRSTCUSTOMERDATAROW 2

// for customer color
#define kNOTYPE 100
