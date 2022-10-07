import 'package:fluent_ui/fluent_ui.dart';

class SideBar extends StatefulWidget {
  final Color color;

  const SideBar({
    super.key,
    this.width = 56,
    this.child,
    this.color = Colors.black,
  });
  final double width;

  final Widget? child;
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: widget.color,
          width: widget.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  buildHeader(),
                  buildItems(),
                ],
              ),
              buildFooter(),
            ],
          ),
        ),
        Expanded(
          child: widget.child ?? Container(),
        )
      ],
    );
  }

  Widget buildHeader() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: IconButton(
            icon: const Icon(
              FluentIcons.reminder_person,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        const Divider(
          size: 10,
          direction: Axis.horizontal,
          style: DividerThemeData(),
        )
      ],
    );
  }

  Widget buildItems() {
    return Column(
      children: [
        for (var i = 0; i < 5; i++)
          Container(
            // color: Colors.grey.withAlpha(200),
            height: 36,
            width: 36,
            child: IconButton(
              icon: const Icon(
                FluentIcons.chat,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
      ],
    );
  }

  Widget buildFooter() {
    return SizedBox(
      height: 56,
      child: IconButton(
        icon: const Icon(
          FluentIcons.settings,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
