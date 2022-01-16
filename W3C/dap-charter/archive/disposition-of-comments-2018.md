# Disposition of Comments - AC Review of Devices and Sensors Working Group Charter
## Summary
* [Revised Charter](https://rawgit.com/w3c/dap-charter/changes-from-ac-review-2018/DeviceAPICharter.html)
* [Charter as Reviewed by AC](https://rawgit.com/w3c/dap-charter/7f3cb64fdfce27a376b6c6b6beff173f6afd0bfa/DeviceAPICharter.html)
* [Diff](https://services.w3.org/htmldiff?doc1=https%3A%2F%2Fcdn.rawgit.com%2Fw3c%2Fdap-charter%2F7f3cb64fdfce27a376b6c6b6beff173f6afd0bfa%2FDeviceAPICharter.html&doc2=https%3A%2F%2Fcdn.rawgit.com%2Fw3c%2Fdap-charter%2F7d6e16467feba5d05b370e5622c6a2f5a9fbc391%2FDeviceAPICharter.html)
* [Review results](https://www.w3.org/2002/09/wbs/33280/DAS-2018/results)
## Responses
* 21 supported the Charter as is
* 3 suggested changes but supported whether or not adopted
* 1 formal objection (with details in email)
* 2 abstentions
* Comments were also invited to be sent to the public-new-work nor public-devices-apis mailing lists. Other than details in support of the formal objection, no comments were received on either list.

## Formal Objections

* One reviewer suggests:
> we'd like it to be more explicit in the charter that
concluding that a specification cannot be done in an appropriate way is
a possible success condition of the working group.

More details are in [this message](https://lists.w3.org/Archives/Public/www-archive/2018May/0002.html).

<b>Resolution:</b> Added a requirement that specs "must mitigate disclosure of data when possible and seek meaningful user consent in other cases."  Accepted suggestion to allow group not to publish/advance a doc if privacy/consent cannot be achieved.  Declined to pull existing specs off of the recommendation track.

## Suggested Changes

* Two reviewers suggested requiring the group's specifications to include accessibility considerations.
<b>Resolution:</b> Reordered section 2.1 to make this requirement more obvious. It was already there, but it was two paragraphs below the requirement for security and privacy considerations.
* One reviewer suggests: 
> While we are abstaining, some here have read "In the interest of agile spec development, the group requests that the Advisory Committee and Director restrict approval reviews for those Charter deliverables adjustments to just the changes in the Charter, rather than considering the entire Charter again for review." as implying that new deliverables might be re-added through some sort of "lightweight" approval process. I suggest that this text be removed, and instead supplied as voter instructions on the charter ballot that has new deliverables ("this charter merely adds new deliverables; AC reps are asked to constrain, if possible, their comments to the new deliverables only and not the rest of the charter").

<b>Resolution:</b>  Change adopted.
* One reviewer observes: 
> ... I rather think that if motion sensors and the like are in scope, the group will have to consider accessibility aspects for people with reduced motion ability; if a web site is built such that it uses motion as an input method.

<b>Resolution:</b>  No further change needed.
* One reviewer suggests
> I would prefer "at least 10 working days" for CfCs; some of us are allowed to take vacation. But I am not a member of this WG, so...

<b>Resolution:</b>  Suggestion declined; the chair(s) are entrusted to use their discretion.
* One reviewer observes: 
> It seems that the group should be wary of getting involved in devices and sensors that are regulated (e.g. body sensors regulated by the FDA, or give data regulated under HIPAA). Should such sensors be explicitly out of scope? Or should we cross that bridge when someone proposes an API for such to be in the scope?

<b>Resolution:</b>  Suggestion declined. Since additional APIs require a revised charter, we can cross this bridge later.
* One reviewer observes: 
> Minor point: not all the deliverables in 3.1 are present in the timeline in 3.4

<b>Resolution:</b>  Added lines to the timetable.

## Editorial changes

* Added a note to the intro warning of privacy and tracking risks.
* Reordered success criteria section in hopes of better readability.
