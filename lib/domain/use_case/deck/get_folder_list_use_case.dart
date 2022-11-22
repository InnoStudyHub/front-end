import 'package:get/get.dart';
import 'package:study_hub/model/models/folders_list.dart';
import '../../../model/repository/cached_repository.dart';

class GetFolderListUseCase {
  const GetFolderListUseCase._();

  static RxList<Folder> invoke() {
    CachedRepository cacheRepo = Get.find();

    if (cacheRepo.folderList.isEmpty) {
      cacheRepo.updateFolders();
    }

    return cacheRepo.folderList;
  }
}
