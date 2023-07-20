part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  const NotificationsState({
    this.status = AuthorizationStatus.notDetermined,
    this.notifications = const [],
  });

  final AuthorizationStatus status;
  final List<PushMessage> notifications;

  NotificationsState copyWith({
    List<PushMessage>? notifications,
    AuthorizationStatus? status,
  }) =>
      NotificationsState(
        notifications: notifications ?? this.notifications,
        status: status ?? this.status,
      );

  @override
  //vvvv equatable
  List<Object> get props => [status, notifications];
}
