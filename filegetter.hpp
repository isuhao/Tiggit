#ifndef _FILEGETTER_HPP_
#define _FILEGETTER_HPP_

#include <stdlib.h>
#include "tmpdir.hpp"

struct FileGetter
{
  TmpDir *tmp;

  boost::filesystem::path base;

  FileGetter() : tmp(NULL) {}

  void setBase(boost::filesystem::path bdir)
  {
    base = bdir;

    // Make sure the dir exists
    boost::filesystem::create_directories(base);

    if(tmp) delete tmp;
    tmp = new TmpDir(base / "tmp");
  }

  ~FileGetter() { if(tmp) delete tmp; }

  // Convert a relative filename to base-centered filename. Also
  // creates any required directories needed to create the resulting
  // path.
  std::string getPath(const std::string &file)
  {
    using namespace boost::filesystem;

    path dest = base / file;

    // Make sure the destination dir exists
    create_directories(dest.branch_path());

    return dest.string();
  }

  // Copy a source file to a given position within the base
  // dir. Returns final path.
  std::string copyTo(const std::string &from, const std::string &to)
  {
    using namespace boost::filesystem;

    path dest = getPath(to);

    // Do explicit check/delete, since overwrite_if_exists is buggy.
    if(exists(dest))
      remove(dest);
    copy_file(from, dest);

    return dest.string();
  }

  // Get the file from the given local position within the base
  // dir. If it doesn't exist, fetch it from the given url. Returns
  // the final path.
  std::string getCache(const std::string &local, const std::string &url)
  {
    using namespace boost::filesystem;

    // This is the final path
    path dest = base / local;

    // Check if it exists
    if(!exists(dest))
      {
        // Nope, we need to download it
        std::string tmp = getFile(url);
        copyTo(tmp, local);
      }

    // Return the absolute filename
    return dest.string();
  }

  /* Takes an input file or URL, decodes it, downloads it if necessary,
     then returns with the local file system file name.
  */
  std::string getFile(const std::string &from)
  {
    assert(tmp);

    DecodeURL loc(from);
    std::string file;

    if(loc.isUrl)
      {
        // Download to a temporary file
        file = tmp->get(loc.basename);
        CurlGet::get(loc.location, file);
      }
    else file = loc.location;

    return file;
  }

  /* Gets a file from the given URL and stores it in the give relative
     base path. Returns the full path.
  */
  std::string getTo(const std::string &url, const std::string &dest)
  {
    return copyTo(getFile(url), dest);
  }
 };

FileGetter get;

#endif
