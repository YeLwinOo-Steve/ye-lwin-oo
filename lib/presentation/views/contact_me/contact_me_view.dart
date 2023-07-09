import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/views/wrapper.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

class ContactMeView extends StatelessWidget {
  const ContactMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      page: GetInTouchPage(),
    );
  }
}

class GetInTouchPage extends StatefulWidget {
  const GetInTouchPage({super.key});

  @override
  State<GetInTouchPage> createState() => _GetInTouchPageState();
}

class _GetInTouchPageState extends State<GetInTouchPage> {
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Text('Get In Touch'.prefixSlash()),
      verticalSpaceMedium,
      Text(
        'Schedule an Appointment',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      context.percentSizedBox(pHeight: s12),
      <Widget>[
        const ContactLabel(
          label: 'Hey, my name is',
        ),
        AnimatedTextField(
          onTap: () {},
          hintText: 'Your Name',
          width: context.percentWidth(s20),
        ),
        const ContactLabel(
          label: "and I'm looking for",
        ),
        AnimatedTextField(
          onTap: () {},
          hintText: 'Your Job Type',
          width: context.percentWidth(s40),
        ),
        const ContactLabel(label: "."),
        const ContactLabel(
          label: 'Get in touch with me at',
        ),
        AnimatedTextField(
          onTap: () {},
          hintText: 'Type Your Email Here',
          width: context.percentWidth(s40),
        ),
        const ContactLabel(label: "!"),
        const ContactLabel(
          label: "I have some special request & more info to tell you about",
        ),
        AnimatedTextField(
          isMultiline: true,
          onTap: () {},
          hintText: 'Tell Me More',
          width: context.percentWidth(s50),
        ),
        const ContactLabel(label: "."),
      ].addWrap(
          spacing: context.percentWidth(
            s1,
          ),
          vSpacing: context.percentHeight(
            s4,
          ),),
    ]
        .addColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .addPadding(
          edgeInsets: context.symmetricPercentPadding(
            vPercent: s10,
            hPercent: s4,
          ),
        );
  }
}

class ContactLabel extends StatelessWidget {
  const ContactLabel({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w300,
          ),
    );
  }
}
