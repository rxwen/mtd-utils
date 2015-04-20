/*
 * platform.c -- Platform specific code
 * 980624
 * (C) 1997-98 Raymond Wen
 *
 * Portions derived from code by Phil Karn (karn@ka9q.ampr.org),
 * Robert Morelos-Zaragoza (robert@spectra.eng.hawaii.edu) and Hari
 * Thirumoorthy (harit@spectra.eng.hawaii.edu), Aug 1995
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials
 *    provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
 * OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
 * TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 */

/*
 * The following parameter defines how many bits are used for
 * field elements. The code supports any value from 2 to 16
 * but fastest operation is achieved with 8 bit elements
 * This is the only parameter you may want to change.
 */

#ifdef NO_RPMATCH
int rpmatch (const char *response)
{
    if (strncmp(response, "yes", strlen("yes")) ||
       strncmp(response, "YES", strlen("YES")) ||
       strncmp(response, "y", strlen("y")) ||
       strncmp(response, "Y", strlen("Y")))
    {
        return 1;
    }
    return 0;
}
#endif

#ifdef NO_GETLINE
#include <stdio.h>
ssize_t getline(char **lineptr, size_t *n, FILE *stream)
{
	int ch;
	char *line = *lineptr;
	size_t alloced = *n;
	size_t len = 0;

	do {
		ch = fgetc(stream);
		if (ch == EOF)
			break;
		if (len + 1 >= alloced) {
			alloced += alloced/4 + 64;
			line = realloc(line, alloced);
            if (line == NULL && alloced != 0)
            {
                fprintf(stderr, "realloc failed");
                exit(1);
            }
		}
		line[len++] = ch;
	} while (ch != '\n');

	if (len == 0)
		return -1;

	line[len] = '\0';
	*lineptr = line;
	*n = alloced;
	return len;
}
#endif

