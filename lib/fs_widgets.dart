library fs_widgets;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef BuildFunction = Widget Function(BuildContext context);

typedef BuildFunctionWithRef = Widget Function(
    BuildContext context, WidgetRef ref);

class _StatelessWidget extends StatelessWidget {
  final BuildFunction builder;
  const _StatelessWidget(this.builder);

  @override
  Widget build(BuildContext context) => builder(context);
}

class _ConsumerWidget extends ConsumerWidget {
  final BuildFunctionWithRef builder;
  const _ConsumerWidget(this.builder);

  @override
  Widget build(BuildContext context, WidgetRef ref) => builder(context, ref);
}

class _HookWidget extends HookWidget {
  final BuildFunction builder;
  const _HookWidget(this.builder);

  @override
  Widget build(BuildContext context) => builder(context);
}

class _HookConsumerWidget extends HookConsumerWidget {
  final BuildFunctionWithRef builder;
  const _HookConsumerWidget(this.builder);

  @override
  Widget build(BuildContext context, WidgetRef ref) => builder(context, ref);
}

class Stateless {
  const Stateless._();
  Widget operator |(BuildFunction builder) => _StatelessWidget(builder);
}

class Consumer {
  const Consumer._();
  Widget operator |(BuildFunctionWithRef builder) => _ConsumerWidget(builder);
}

class Hook {
  const Hook._();
  Widget operator |(BuildFunction builder) => _HookWidget(builder);
}

class HookConsumer {
  const HookConsumer._();
  Widget operator |(BuildFunctionWithRef builder) =>
      _HookConsumerWidget(builder);
}

const statelessWidget = Stateless._();
const consumerWidget = Consumer._();
const hookWidget = Hook._();
const hookConsumerWidget = HookConsumer._();
