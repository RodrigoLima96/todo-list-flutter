part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool switchValue;
  const SwitchState({required this.switchValue});

  Map<String, dynamic> toMap() {
    return {
      'switchValue': switchValue,
    };
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(
      switchValue: map['switchValue'] ?? false,
    );
  }

  @override
  List<Object> get props => [switchValue];
}

class SwitchInitial extends SwitchState {
  const SwitchInitial({required bool switchValue})
      : super(switchValue: switchValue);
}
