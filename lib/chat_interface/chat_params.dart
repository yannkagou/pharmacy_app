class ChatParams {
  final String userUid;
  final String peerUid;
  final String peerName;

  ChatParams(this.userUid, this.peerUid, this.peerName);

  String getChatGroupId() {
    if (userUid.hashCode <= peerUid.hashCode) {
      return '$userUid-${peerUid}';
    } else {
      return '${peerUid}-$userUid';
    }
  }
}
