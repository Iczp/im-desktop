import 'package:fluent_ui/fluent_ui.dart';

import '../../widgets/card_highlight.dart';
import '../../widgets/page.dart';

class ChatingPage extends StatefulWidget {
  const ChatingPage({Key? key}) : super(key: key);

  @override
  State<ChatingPage> createState() => _ChatingPageState();
}

class _ChatingPageState extends State<ChatingPage> with PageMixin {
  bool disabled = false;
  double firstValue = 23.0;
  double verticalValue = 50.0;

  int topIndex = 0;

  PaneDisplayMode displayMode = PaneDisplayMode.auto;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      // appBar: const NavigationAppBar(
      //   title: Text('NavigationView'),
      // ),
      pane: NavigationPane(
        selected: topIndex,
        onChanged: (index) => setState(() => topIndex = index),
        displayMode: displayMode,
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.home),
            title: const Text('Home'),
            body: BodyItem(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.issue_tracking),
            title: const Text('Track an order'),
            infoBadge: const InfoBadge(source: Text('8')),
            body: BodyItem(),
          ),
          PaneItemExpander(
            icon: const Icon(FluentIcons.account_management),
            title: const Text('Account'),
            body: BodyItem(),
            items: [
              PaneItem(
                icon: const Icon(FluentIcons.mail),
                title: const Text('Mail'),
                body: BodyItem(),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.calendar),
                title: const Text('Calendar'),
                body: BodyItem(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget build1(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: PageHeader(
        title: const Text('消息'),
        commandBar: ToggleSwitch(
          checked: disabled,
          onChanged: (v) => setState(() => disabled = v),
          content: const Text('Disabled'),
        ),
      ),
      children: [
        const Text(
          'Use a Slider when you want your users to be able to set defined, '
          'contiguous values (such as volume or brightness) or a range of discrete '
          'values (such as screen resolution settings).\n\n'
          'A slider is a good choice when you know that users think of the value '
          'as a relative quantity, not a numeric value. For example, users think '
          'about setting their audio volume to low or medium—not about setting '
          'the value to 2 or 5.',
        ),
        subtitle(content: const Text('A simple Slider')),
        CardHighlight(
          codeSnippet: '''double value = 0;

Slider(
  label: '\${value.toInt()}',
  value: value,
  onChanged: disabled ? null : (v) => setState(() => value = v),
),
''',
          child: Row(children: [
            Slider(
              label: '${firstValue.toInt()}',
              value: firstValue,
              onChanged: disabled
                  ? null
                  : (v) {
                      setState(() => firstValue = v);
                    },
            ),
            const Spacer(),
            Text('Output:\n${firstValue.toInt()}'),
          ]),
        ),
        subtitle(content: const Text('A vertical slider')),
        description(
          content: const Text(
            '''You can orient your slider horizontally or vertically. Use these guidelines to determine which layout to use.

    *   Use a natural orientation. For example, if the slider represents a real-world value that is normally shown vertically (such as temperature), use a vertical orientation.
    *   If the control is used to seek within media, like in a video app, use a horizontal orientation.
    *   When using a slider in page that can be panned in one direction (horizontally or vertically), use a different orientation for the slider than the panning direction. Otherwise, users might swipe the slider and change its value accidentally when they try to pan the page.
    *   If you're still not sure which orientation to use, use the one that best fits your page layout.''',
          ),
        ),
        CardHighlight(
          codeSnippet: '''double value = 0;

Slider(
  vertical: true,
  label: '\${value.toInt()}',
  value: value,
  onChanged: disabled ? null : (v) => setState(() => value = v),
),
''',
          child: Row(
            children: [
              Slider(
                vertical: true,
                label: '${verticalValue.toInt()}',
                value: verticalValue,
                onChanged:
                    disabled ? null : (v) => setState(() => verticalValue = v),
              ),
              const Spacer(),
              Text('Output:\n${verticalValue.toInt()}'),
            ],
          ),
        ),
      ],
    );
  }
}

class BodyItem extends StatelessWidget {
  const BodyItem({
    Key? key,
    this.header,
    this.content,
  }) : super(key: key);

  final String? header;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      header: PageHeader(title: Text(header ?? 'This is a header text')),
      content: content ?? const SizedBox.shrink(),
    );
  }
}
