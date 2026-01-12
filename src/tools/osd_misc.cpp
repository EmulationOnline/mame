#include <cstdlib>

const char *osd_getenv(const char *name)
{
	return std::getenv(name);
}