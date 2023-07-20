part of 'notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();
}

class NotificationStatusChanged extends NotificationsEvent {
  final AuthorizationStatus status;
  const NotificationStatusChanged(this.status);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class NotificationReceived extends NotificationsEvent {
  final PushMessage notification;
  const NotificationReceived(this.notification);

  @override
  List<Object?> get props => throw UnimplementedError();
}
