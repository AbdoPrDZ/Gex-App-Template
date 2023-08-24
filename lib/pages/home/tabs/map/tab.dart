import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';

import '../../../../utils/utils.dart' as utils;
import 'controller.dart';

class MapTab extends utils.Page<MapTabController> {
  MapTab({Key? key}) : super(controller: MapTabController(), key: key);

  @override
  MapTabController get controller => super.controller!;

  @override
  Widget buildBody(BuildContext context) => const MapLocationPicker(
        apiKey: 'AIzaSyCHYTCYmSyk9Y4tuyRL6sR7e07xFHw0Mew',
        onNext: print,
      );
}
