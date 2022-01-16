# [Security and Privacy Self-Review Questionnaire] for [Proximity Sensor]

Answers to the [questionnaire][Security and Privacy Self-Review Questionnaire] for
[Generic Sensor API] can be found [here](https://github.com/w3c/sensors/blob/master/security-questionnaire.md).

## [3.1 Does this specification deal with personally-identifiable information?]

No.

## [3.2 Does this specification deal with high-value data?]

No.

## [3.3 Does this specification introduce new state for an origin that persists across browsing sessions?]

No.

## [3.4 Does this specification expose persistent, cross-origin state to the web?]

No.

## [3.5 Does this specification expose any other data to an origin that it doesn’t currently have access to?]

No.

## [3.6 Does this specification enable new script execution/loading mechanisms?]

No.

## [3.7 Does this specification allow an origin access to a user’s location?]

No.

## [3.8 Does this specification allow an origin access to sensors on a user’s device?]

Yes.

## [3.9 Does this specification allow an origin access to aspects of a user’s local computing environment?]

Yes. If user agent has [permission] to access proximity sensor, the API provides means to check
if sensor is available within user’s local computing environment.

## [3.10 Does this specification allow an origin access to other devices?]

No.

## [3.11 Does this specification allow an origin some measure of control over a user agent’s native UI?]

No.

## [3.12 Does this specification expose temporary identifiers to the web?]

No.

## [3.13 Does this specification distinguish between behavior in first-party and third-party contexts?]

No.

## [3.14 How should this specification work in the context of a user agent’s "incognito" mode?]

Specification does not restrict access to a particular mode, nor work differently. However, this
can be revisited when [privacy mode] would be formally specified.

## [3.15 Does this specification persist data to a user’s local device?]

No.

## [3.16 Does this specification have a "Security Considerations" and "Privacy Considerations" section?]

Yes.

See: [Security & Privacy][security-and-privacy] section.

## [3.17 Does this specification allow downgrading default security characteristics?]

No.

<!--- References -->
[Generic Sensor API]: https://w3c.github.io/sensors
[Proximity Sensor]: https://w3c.github.io/proximity

[security-and-privacy]: https://w3c.github.io/proximity/#security-and-privacy
[permission]: https://w3c.github.io/sensors/#permissions
[privacy mode]: https://gist.github.com/mnot/96440a5ca74fcf328d23#privacy-mode
[Security and Privacy Self-Review Questionnaire]: https://w3ctag.github.io/security-questionnaire/

[3.1 Does this specification deal with personally-identifiable information?]: https://w3ctag.github.io/security-questionnaire/#pii
[3.2 Does this specification deal with high-value data?]: https://w3ctag.github.io/security-questionnaire/#credentials
[3.3 Does this specification introduce new state for an origin that persists across browsing sessions?]: https://w3ctag.github.io/security-questionnaire/#persistent-origin-specific-state
[3.4 Does this specification expose persistent, cross-origin state to the web?]: https://w3ctag.github.io/security-questionnaire/#persistent-identifiers
[3.5 Does this specification expose any other data to an origin that it doesn’t currently have access to?]: https://w3ctag.github.io/security-questionnaire/#other-data
[3.6 Does this specification enable new script execution/loading mechanisms?]: https://w3ctag.github.io/security-questionnaire/#string-to-script
[3.7 Does this specification allow an origin access to a user’s location?]: https://w3ctag.github.io/security-questionnaire/#location
[3.8 Does this specification allow an origin access to sensors on a user’s device?]: https://w3ctag.github.io/security-questionnaire/#sensors
[3.9 Does this specification allow an origin access to aspects of a user’s local computing environment?]: https://w3ctag.github.io/security-questionnaire/#local-device
[3.10 Does this specification allow an origin access to other devices?]: https://w3ctag.github.io/security-questionnaire/#remote-device
[3.11 Does this specification allow an origin some measure of control over a user agent’s native UI?]: https://w3ctag.github.io/security-questionnaire/#native-ui
[3.12 Does this specification expose temporary identifiers to the web?]: https://w3ctag.github.io/security-questionnaire/#temporary-id
[3.13 Does this specification distinguish between behavior in first-party and third-party contexts?]: https://w3ctag.github.io/security-questionnaire/#first-third-party
[3.14 How should this specification work in the context of a user agent’s "incognito" mode?]: https://w3ctag.github.io/security-questionnaire/#incognito
[3.15 Does this specification persist data to a user’s local device?]: https://w3ctag.github.io/security-questionnaire/#storage
[3.16 Does this specification have a "Security Considerations" and "Privacy Considerations" section?]: https://w3ctag.github.io/security-questionnaire/#considerations
[3.17 Does this specification allow downgrading default security characteristics?]: https://w3ctag.github.io/security-questionnaire/#relaxed-sop
