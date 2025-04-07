import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/ui_design/data/members_model.dart';

class MembersProvider extends ChangeNotifier {
  AssetImage trailingIcon = AssetImage("assets/Toggle.png");
  List<MembersModel> membersData = [];
  List<int> changedIcon = [];

  void loadMembersData() {
    membersData = [
      MembersModel(
        id: 1,
        memberImageLocation: 'assets/AF.png',
        memberName: 'Ranjit Shrestha',
        memberContact: '+977 9814017327',
        trailingIcon: 'assets/Toggle.png',
      ),
      MembersModel(
        id: 2,
        memberImageLocation: 'assets/AF.png',
        memberName: 'Ranjit Shrestha',
        memberContact: '+977 9814017327',
        trailingIcon: 'assets/Toggle.png',
      ),
      MembersModel(
        id: 3,
        memberImageLocation: 'assets/AF (1).png',
        memberName: 'Jean Bonds',
        memberContact: '+1 46545645645',
        trailingIcon: 'assets/Toggle.png',
      ),
      MembersModel(
        id: 4,
        memberImageLocation: 'assets/AF (1).png',
        memberName: 'Jean Bonds',
        memberContact: '+1 46545645645',
        trailingIcon: 'assets/Toggle.png',
      ),
      MembersModel(
        id: 5,
        memberImageLocation: 'assets/AF (2).png',
        memberName: 'Raily Hopes',
        memberContact: '+61 314017327',
        trailingIcon: 'assets/Toggle.png',
      ),
      MembersModel(
        id: 6,
        memberImageLocation: 'assets/AF (2).png',
        memberName: 'Raily Hopes',
        memberContact: '+61 314017327',
        trailingIcon: 'assets/Toggle.png',
      ),
      MembersModel(
        id: 7,
        memberImageLocation: 'assets/AF (3).png',
        memberName: 'Andy Thomas',
        memberContact: '+45 4017327',
        trailingIcon: 'assets/Toggle.png',
      ),
      MembersModel(
        id: 8,
        memberImageLocation: 'assets/AF (3).png',
        memberName: 'Andy Thomas',
        memberContact: '+45 4017327',
        trailingIcon: 'assets/Toggle.png',
      ),
    ];
  }

  AssetImage changeIcon(AssetImage image, int idFromUi) {
    // final member = membersData.firstWhere((m) => m.id == id);
    // // final member = membersData.where(((a) => a.id == id));
    // if (member.trailingIcon == 'assets/_Toggle base.png') {
    //   member.trailingIcon = 'assets/Toggle.png';
    // } else {
    //   member.trailingIcon = 'assets/_Toggle base.png';
    // }
    if (!(changedIcon.contains(idFromUi))) {
      changedIcon.add(idFromUi);
    } else {
      changedIcon.remove(idFromUi);
    }

    notifyListeners();
    return trailingIcon;
  }
}

final trailingIconProvider = ChangeNotifierProvider<MembersProvider>((ref) {
  return MembersProvider();
});
