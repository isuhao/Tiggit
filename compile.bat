windres --output-format=coff resources.rc resources.res

g++ misc/dirfinder.cpp misc/lockfile.cpp misc/freespace.cpp misc/logger.cpp libs/mangle/stream/clients/io_stream.cpp gameinfo/stats_json.cpp gameinfo/tigloader.cpp list/sortlist.cpp list/listbase.cpp list/picklist.cpp list/parentbase.cpp tiglib/gamedata.cpp tiglib/gamelister.cpp tiglib/sorters.cpp tiglib/repo.cpp misc/fetch.cpp tiglib/liveinfo.cpp tiglib/news.cpp tiglib/repo_locator.cpp launcher/run.cpp launcher/run_windows.cpp wx/frame.cpp wx/tabbase.cpp wx/image_viewer.cpp wx/gametab.cpp wx/progress_holder.cpp wx/gamelist.cpp wx/listbase.cpp wx/newstab.cpp wx/dialogs.cpp app_wx/wxtiggit_main.cpp app_wx/gamedata.cpp app_wx/gameinf.cpp app_wx/gamelist.cpp app_wx/notifier.cpp app_wx/jobprogress.cpp app_wx/appupdate.cpp app_wx/importer_backend.cpp app_wx/importer_gui.cpp libs/spread/libs/jsoncpp/src/json_reader.cpp libs/spread/libs/jsoncpp/src/json_writer.cpp libs/spread/libs/jsoncpp/src/json_value.cpp libs/spread/libs/sha2/sha2.c libs/spread/job/thread.cpp libs/spread/job/job.cpp libs/spread/job/jobinfo.cpp libs/spread/misc/comp85.cpp libs/spread/misc/jconfig.cpp libs/spread/misc/readjson.cpp libs/spread/unpack/dirwriter.cpp libs/spread/unpack/base.cpp libs/spread/unpack/unpack_zip.cpp libs/spread/unpack/auto.cpp libs/spread/tasks/unpack.cpp libs/spread/tasks/curl.cpp libs/spread/tasks/download.cpp libs/spread/hash/hash.cpp libs/spread/htasks/hashtask.cpp libs/spread/htasks/unpackhash.cpp libs/spread/htasks/downloadhash.cpp libs/spread/htasks/copyhash.cpp libs/spread/dir/directory.cpp libs/spread/dir/from_fs.cpp libs/spread/cache/index.cpp libs/spread/rules/install_finder.cpp libs/spread/rules/ruleset.cpp libs/spread/rules/arcruleset.cpp libs/spread/rules/rule_loader.cpp libs/spread/install/action_installer.cpp libs/spread/install/build_actions.cpp libs/spread/install/installer.cpp libs/spread/sr0/sr0.cpp libs/spread/spreadlib/spread.cpp -o tiggit.exe -Wl,--subsystem,windows -I. -I./libs/ -I./libs/spread -I./libs/spread/libs/jsoncpp/include/ -I../wxWidgets/include -I../wxWidgets/lib/gcc_dll/mswu -I../curl-7.21.7/include -I../mingw-div/include/ -L../boost -lboost_filesystem -lboost_system -lboost_thread -I../zziplib -I../zlib -L../zziplib/zzip -lzzip -L../zlib-1.2.5 -lz -L../curl-7.21.7/lib/.libs/ -lcurl wxbase28u_gcc_custom.dll wxmsw28u_core_gcc_custom.dll resources.res

chmod a+rwx tiggit.exe
