#include "isogram.h"
#include <ctype.h>
#include <stddef.h>
#include <stdio.h>
#include <glib.h>
#include <string.h>
#include <stdlib.h>

#define IS_LETTER(c) ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))

bool isAll(char *str, bool (*fun)(char)) {
  bool res;
  while (*str) {
    res = (*fun)(*str);
    if (res == false) { return false; }
    str++;
  }
  return true;
}

bool isLowercase(char c) {
  return (bool)islower(c);
}

bool hasAnyDuplicate(char *str) {
  GHashTable *table = g_hash_table_new(g_int_hash, g_int_equal);
  while (*str) {
    char c = tolower(str[0]);
    if (g_hash_table_contains(table, &c)) return true;
    g_hash_table_add(table, &c);
    str++;
  }
  return false;
}

char *filterOutNonLetterChars(char *str) {
  int len = strlen(str) + 1;
  /* TODO: @jbodah 2017-09-24 free unused chars */
  char *buffer = malloc(sizeof(char) * len);
  char *next = buffer;
  while (*str) {
    if (IS_LETTER(*str)) {
      *next = *str;
      next++;
    }
    str++;
  }
  *next = '\0';
  return buffer;
}

bool isIsogram(char *str) {
  if (strlen(str) == 0) return true;

  str = filterOutNonLetterChars(str);

  if (hasAnyDuplicate(str)) return false;

  if (isAll(str, &isLowercase)) return true;

  return true;
}
