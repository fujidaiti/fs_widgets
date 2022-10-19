library fs_widgets;

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef BuildFunction = Widget Function(BuildContext context);

typedef BuildFunctionWithSetState = Widget Function(
    BuildContext context, SetStateFunction setState);

typedef SetStateFunction = void Function(void Function());

typedef BuildFunctionWithRef = Widget Function(
    BuildContext context, WidgetRef ref);

class StatelessComponent extends StatelessWidget {
  final BuildFunction builder;
  const StatelessComponent(this.builder, {super.key});

  @override
  Widget build(BuildContext context) => builder(context);
}

class StatefulComponent extends StatefulWidget {
  final BuildFunctionWithSetState builder;
  const StatefulComponent(this.builder, {super.key});

  @override
  State<StatefulWidget> createState() => _ComponentState();
}

class _ComponentState extends State<StatefulComponent> {
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);
}

class ConsumerComponent extends ConsumerWidget {
  final BuildFunctionWithRef builder;
  const ConsumerComponent(this.builder, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => builder(context, ref);
}

class HookComponent extends HookWidget {
  final BuildFunction builder;
  const HookComponent(this.builder, {super.key});

  @override
  Widget build(BuildContext context) => builder(context);
}

class HookConsumerComponent extends HookConsumerWidget {
  final BuildFunctionWithRef builder;
  const HookConsumerComponent(this.builder, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => builder(context, ref);
}
