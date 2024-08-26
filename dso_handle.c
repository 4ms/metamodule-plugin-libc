void *ImageHandle;
const void *const __dso_handle = &ImageHandle;

int getentropy(void *buffer, unsigned length) {

  char *b = buffer;

  for (unsigned i = 0; i < length; i++)
    *b++ = 1;
  return 0;
}
