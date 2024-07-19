import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/image_profile_enum.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/pages/my_profile_page.dart';
import 'package:flutter/material.dart';

class ContainerProfileImage extends StatefulWidget {
  const ContainerProfileImage({super.key});

  @override
  State<ContainerProfileImage> createState() => _ContainerProfileImageState();
}

class _ContainerProfileImageState extends State<ContainerProfileImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            MyProfilePage.route,
            arguments: {'profile': Global.profile},
          ).then((value) => setState(() {}));
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: Global.profile?.image != null &&
                      Global.profile!.image!.isNotEmpty
                  ? NetworkImage(
                      Global.profile!.image!,
                    )
                  : AssetImage(ImageProfileEnum.avatar.path)
                      as ImageProvider<Object>,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
