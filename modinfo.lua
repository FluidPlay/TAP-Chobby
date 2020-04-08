return {
  name = 'TAP Chobby',
  shortName = 'TAP_CHOBBY',
  description = 'TAP mutator for Chobby',
  version = '$VERSION',
  mutator = 'Official',
  modtype = 5,
  onlyLocal = true,
  depend = {
      'rapid://chobby:test',
      -- 'Chobby $VERSION',
  },
}
