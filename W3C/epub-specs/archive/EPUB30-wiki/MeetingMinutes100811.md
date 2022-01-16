Chair: Markus Gylling

Scribe: Bill McCoy


Audio recording: 100811

To listen to the recording, dial in and press star 3

## Attendees ##

Takeshi, Si-Wei, Dan, DaveGunn, wenhsuan, EricFreese1, gc, karenbroome, liza, ChoChin, DanHughes, Kyoji, Norm, keith\_fahlgren, BillMcCoy, RogerWebster, marisa\_demeglio, George, !Roger\_S, kenny\_j, KingWai, AdamWitwer, danielweck, awiles, oedipus, Brady, !MURATAMak, Ryoji\_Akimoto, EricFreese, Mei-Li, mgylling, BillKasdorf

## Action Items ##

  * all subgroup coordinators who know that there are expectations or dependencies on another group should notify the subgroup coordinator in question

  * Makoto, Brady, BillM to propose draft of such a CSS2 WG liaison letter

  * Markus to add ARIA requirements to text content list

  * Peter S to define chapter-level scripting on email list

## Previous minutes ##

Accepted previous minutes.

## Process overview, solutions ##

Markus: solution proposals: we still have work on reqs gathering/prioritization, but per prev call, starting solution proposal work is OK, as long as subgroup accepts consequences that may arise from reqs changing

Markus: Aug 27 is the close for reqs, consequence is we have a revised timeline, it doesn't impact end date of project, we try to speed things up at latter part (only 2 working drafts planned)

Markus: link in agenda summarizes the process, so idea is to continue to use the Wiki, try to keep proposals short & to the point for now, esp. as reqs are still changing so no point in getting really elaborate yet

Markus: HOWEVER for those who engage in solution proposals, be prepared that editor group may later on ask you to expand proposal into prose that can be fodder for the specification

Markus: do add your name, editor group wants to track for future work items

Markus: I'd be surprised if we dont' have at least some competing proposals, at this time that's goodness, ultimately we must settle on one. In terms of decision making, if conflicting proposals exist and there's no obvious choice based on reqs & principles, the subgroup coord should elevate to the whole WG... the whole WG remains the sole decision making instance in this process

Markus: per updated timeline, 1st draft deadline for new features is Oct 8, roughly 2 months

Markus: BillK - you're getting solution proposals in your subgroup, do you have suggestions/comments?

## metadata ##

BillK: Will double as subgroup status report. We did ranking exercise to prioritize, results fairly narrow range (nothing irrelevant or dominant), but there's still some varying understandings of what reqs mean, so we decided to move to soliciting solutions in the interest of clarifying reqs

BillK: we want subgroup members to volunteer to float solutions for each req they feel they have the expertise for, and we have a place in the wiki for 2 proposals for each plus room for comments. The point of having 2 slots for proposals is to avoid alternatives to first proposed solution being buried in comments

BillK: template in the email I sent, and on our sec of wiki

Markus: other subgroups should take a look at the template and we advise you to use it for consistency

BillK: issue was on implications of reqs, for example one fundamental issue is embedded metadata vs. external references. For many reqs, it's not clear which approach makes sense, by getting initial drafts of proposed solutions that should become more clear

BillK: note that despite prioritization, we are doing this solution phase irregardless of priorities, since some people have passion around specific items, and we may revisit priorities after we have proposals

Markus: and prioritization may become more relevant later after we decide we dont' have time, and if there's no proposal for a feature it may not make it into the spsec

BillK: and something ranked low in our list may turn out to be essential to another subgroup's work so we can't finalize priorities in isolation

Markus: again, remember that until Aug 27 kickoff of solution phase any solution proposal work is only preliminary

## subgroup status reports ##

Markus: happy to see Peter has kicked off prioritization for his subgroup, which may be one of trickier ones due to heterogenous reqs

Markus: metadata is an example of where other subgroups expect you to have a solution or there's a co-dependency. My suggestion is that each subgroup should collect expectations / co-dependencies on their own wiki page, so subgroup leader is aware of these

BillK: that would be extremely important

Markus: if you have reqs in list that need special review attention because there may be various opinions about reqs or impact, please notify the entire WG on the list "special review attention"

## annotations ##

Markus: regrets from Will, he hopes to catch up tomorrow

## navigation ##

George: little bit of activity, a couple reqs that were already incorporated, otherwise it's very quiet, I will contact Chic Manual of Style folks about bibliographic refrerences

Markus: that's an example where working w/ metadata group is important

BillK: George is a metadata group member

## text content ##

Markus: prioritization done, telecon last week, some reqs have missing priorities (? in the wiki list), action items assigned to Peter, Garth to complete these, but generally we have gone as far as we can go without getting down to extreme details which is too atomic to do now, so looking pretty good

## styling & layout ##

Brady: requested priority submissions by Friday, also proposed that any of reqs that do not end up w/ use cases by the time we're done should be capped at a "C" grade, but still have quite a few reqs missing use cases, hoping that will be a spur

Markus: is use non-obvious?

Brady: I'd like to have use cases for everything, and even when you discuss hyphenation, but even if you add that there be dictionaries that determine how pit occurs, I'd like to see an example

## rich media, interactivity, & ads ##

Peter: I asked people to rank stuff but not much activity yet. some of this might be better handled by EGLS (Taiwan and maybe others) the level of interest in sompe of these reqs seems to change by the country, so still may see some more reqs coming in, then we will sort out who's going to handle them

Markus: did you see marisa email re: prioritization of audio synch?

Peter: if you send it to the whole group then I won't lose it, random emails addressed just to me may be problematic

Peter: I found yours Marisa

Marisa: I looked at other reqs excluding interactivity, I think there's other aspects we need to clarify, but haven't talked about what's in our scope for things like captioning of video, I think we need to determine that

## EGLS ##

Makoto: without deep diving on CSS 10 minutes should be enough

Makoto: F2F meeting Aug 2-3 in Sapporo: fruitful and enjoyable, 26 attendees 14 Japan 6 Taiwan 4 from US and 2 from Korea

Makoto: presentation slides available on the Sapporo EGLS F2F wiki page, minutes are being reviewed by attendees and should be sent to WG in 1 week or so

Makoto: we reviewed all requirements in detail, and should complete the merging process in 1 week or so. But have to admit that we have mainly Japanese and Taiwanes requirements

Makoto: we don't have Hebrew, Arabic, Thai, etc. reqs - so I'm not very hopeful about completing this by Aug 27

Markus: BillK put you in touch w/ Egyption conversion house and publisher, what happened?

Makoto: they said reqs were too technical, so I will contact them directly

BillK: direct contact may be helpful

[keith\_fahlgren](keith_fahlgren.md) Are you speaking with Ramy Habeeb of Kotobarabia?

Makoto: EGLS reqs can be viewed into 6 groups: page progression direction, vertical writing, line breaking, ruby/emphasis, user defined characters/glyphs and others (misc)

Makoto: we reviewed each in turn, I won't explain in detail, you might want to have a look at wiki page or have a look at minutes

Makoto: CSS: we often discussed potential solutions, in many cases for each feature there's one relevant CSS3 module, for example vertical writing, for example vertical writing there's CSS Text Layout Module

Makoto: however it's still a Working Draft not Candidate Recommendation. We believe the entire WG is interested in this topic

Makoto: Murakami-san is AntennaHouse and coordinator of CSS3 text layout, I invited him as expert and he attended. He proposed 4 options

Makoto: a) wait for CSS3 - may take a long time

Makoto: b) introduce experimental properties with our own prefix even if only in WD

Makoto: c) introduce our own properties (not from WD)

Makoto: d) introduce our own non-CSS solution for example using metadata or HTML-level elements

Makoto: I put these on the wiki, name of the page is css3relations, it is quite sketchy now, we would like to propose that entire WG should send a liaison letter to CSS3 WG for collaboration

Garth: we have a CSS3 member in our WG Mike Smith

Makoto: from EGLS perspective., we need more coordination and a rep on the CSS WG

[oedipus](oedipus.md) note CSS Snapshot http://www.w3.org/TR/css-beijing / http://www.w3.org/TR/2010/WD-css-beijing-20100727/ in "Last Call" until 2010-08-15 (defines which CSS documents are stable and validateable) but not a reflection of browser support

Makoto: I will ask CSS to send Kenny Lu (sp?) as invited expert to IDPF, he is Taiwanes living in Japan and speaks Japanese and can provide info on things like Mongolian

Makoto: I'm hoping to get him involved in this WG heavily

Makoto: the W3C WG is having a F2F in 2 weeks, I was requested to provide draft EGLS reqs to this meeting, and I think we should take advantage of this oppotunity and send reqs from the whole WG

Makoto: next teleconf is Aug 17, we plan to have another F2F meeting in Taiwan dedicated to solutions, in Sep or Oct, planning to invite another co-editor of CSS3 Text Layout, known as Santa-sai, to this meeting

Brady: I did get impression from CSS people attending EGLS F2F that they want to listen to our reqs, so a strong relationship makes sense to me

Markus: what about Mike Smith?

Makoto: CSS is trying to get Kenny Lu to cover our requirements

[gregory](gregory.md) http://www.w3.org/People/all#mike

[gregory](gregory.md) http://www.w3.org/People/Smith/

Markus: please clean up your draft, and contact Mike Smith (W3C) and let him suggest how to go further

Markus: let WG leadership have a look at it further

Brady: shall I take next pass?

Markus: timeline updated, which gives EGLS some extra time, 27 is the next upcoming finalizaiton of reqs date, I know it's not far away, with regards to Mongolian, bidi, we know we can't achieve the impossible, if we don't have reqs for particular locales, then eventually we must regard it as out of scope for this particular version

[George](George.md) Lost the call, will be back

Markus: we will provide time at WG call for prioritization of reqs if required

BillM: F2F was very productive, lots of work got done

Peter: do we agree that vertical writing will be a requirement for EPUB 2.1 systems?

Peter: there are practical considerations, I would like to nail this down so we decide that it is or not, rather than later on find that some people decide that it's optional

Peter: is it a core requirement or not, deciding from the start would be helpful

Markus: let's try to solve this on the list or next call

Peter: will send email to the list

## scripting & ARIA ##

Markus: we have notion of chapter-level scripting, we are saying that (with reluctance from some parties) that we are saying we want to have chapter level scripting

Markus: we want a fallback or some mecahnism to handle when RS doesn't handle scripting

Markus: and some way to signify that content includes chapter levle scripting

Markus: we must ensure content works if chapter level scripting is not supported by the user

[gregory](gregory.md) mgylling, CSS f2f in oslo http://wiki.csswg.org/planning/oslo-2010?s[]=f2f

Markus: we asked Keith to have a look at ARIA, Keith send email at beginning of week outlinine preliminary info

[gregory](gregory.md) http://www.w3.org/WAI/PF/aria/

[gregory](gregory.md) http://www.w3.org/WAI/PF/aria-primer/

Markus: can you give us a 1 minute summary?

[gregory](gregory.md) http://www.w3.org/WAI/PF/aria-implementation/

[gregory](gregory.md) http://www.w3.org/WAI/PF/role-attribute

KeithF: I don't have a complete understanding, but wrt question does ARIA provide functionality on how interactive content may be presented more reasonably on a range of devices and with accessibility, the answer is yes

KeithF: there are both creation and implementation guides that directly apply to this problem

[gregory](gregory.md) http://www.w3.org/WAI/PF/aria-practices/

KeithF: I don't believe ARIA will solve every person's concern about potential drawbacks but it should make a number of people more comfortable

KeithF: depending on harmonization with emerging HTML5 spec, there's quite a bit of ARIA referenced directly from HTML5 draft even though ARIA is not finalized

[gregory](gregory.md) WAI-ARIA going to Last Call this month

Peter: question was does it help us to solve problem of what happens when scripting is turned off vs. what happens in making scripted content accessible

Peter: I didn't see much about what happens when scripting is turned off in ARIA

[gregory](gregory.md) previous links link to editors' draft which are going to be published this august as a last call document

KeithF: that is right, it doesn't provide fallbacks or other techniques

KeithF: it provides mechanisms to hook on to to make scripting a smaller accessibility problem

Gregory: original intent of ARIA was as a bridging technology, particularly for widgets that don't have their own user interface

Gregory: role attribute upon which much of ARIA is based, it gets you landmarks, table of contents, search form, etc.

Gregory: ARIA is for HTML5, HTML5 WG is discussing what HTML5 accessibility task force, ARIA integraiton is a fluid situation

Gregory: ARIA lives on top of scripted content, yes

Gregory: it also helps to improve declarative content

Peter: there is certainly a lot of help for accessibility, scripted or non-scripted, but nothing that helps a non-scripted solution when you disable scripts

Peter: it's not really designed to do it, it's fundamentally designed to help accessibility not non-scriptable enviornments

Markus: easy part is accessibility, it seems we may want to compose requirements that require inclusion of ARIA in order to maintain accessibility, that should go into Text content WG, I will take an action item

[keith\_fahlgren](keith_fahlgren.md) http://www.w3.org/TR/html5/scripting-1.html#the-noscript-element

[gregory](gregory.md) http://dev.w3.org/html5/spec/content-models.html#annotations-for-assistive-technology-products-aria

Brady: we would put something in the spec, you may have chapter level scripting but EPUB must be usable if scripting is turned off, this would be a conformance req of publications, rather than having specific technology to enforce

Brady: one example is being able to change between English and Metric, if scripting is turned off some units must be visible

[gregory](gregory.md) ARIA gives landmarking which is a boon to navigation and isn't script dependent

Brady: content would still be there

Keith: we should be up to speed on noscript element

[gregory](gregory.md) "The noscript element represents nothing if scripting is enabled, and represents its children if scripting is disabled. It is used to present different markup to user agents that support scripting and those that don't support scripting, by affecting how the document is parsed."

Keith: fallbacks that are meaningful in no script environments yes, but I don't think it's reasonable to force authors of scripted content to do some baroque fallback mecahnism

Keith: it's an intractable problem

Peter: I have view that chapter is not right way to do scripting, I agree about islands, there we can do something that would work across all applications, someone who is using chapter level scripting is not going to work across all implementation

Peter: extending that even further, to say content may not work, I don't think it's going to cut it

Peter: HTML5 is basically an application environment, documents should work even if you don't have scripting

[gregory](gregory.md) so ARIA gives UI and state control/awareness for scripted objects, landmarks for documentation and page ordering, and a means of annotating (aria-labelledby and aria-describedby for example)

BillM: want fallback, progressive enhancement is where should fight battle -- content live in island or chapter? as KF said arbitrary scripted content should be limited to islands

Brady: for spine-item levle scripting, not something for islands

DaveM: sounds reasonable, one question about "must" - how do we validate it in code?

DaveM: I don't know that you can validate that there's readable content

DaveM: we want to make our musts mean something, so we can block

[gregory](gregory.md) there is accessibility without ARIA, but there aren't inherently accessible scripts without ARIA

[keith\_fahlgren](keith_fahlgren.md) Making the MUSTs in the EPUB spec more powerful was a criticism from outside as well (Joseph Pearson, among others)

Peter: should gets ignored, saying content shouldn't behave this way, so "must" even that's subjective and must be human validated is

[liza](liza.md) I don't think it's fair to say that SHOULDs are ignored because just one reading system implements JavaScript

Peter: just because you can't machine verify it, doesnt' mean the must isn't important

Liza: there is only 1 so that should have been effective

[keith\_fahlgren](keith_fahlgren.md) EPUB Reading System implementors have read the SHOULD NOT. It means: "there may exist valid reasons in particular circumstances when the

[keith\_fahlgren](keith_fahlgren.md) particular behavior is acceptable or even useful, but the full

[keith\_fahlgren](keith_fahlgren.md) implications should be understood and the case carefully weighed

[keith\_fahlgren](keith_fahlgren.md) before implementing". They weighed it.

[gregory](gregory.md) RFC 2119 SHOULDs are pretty stringent http://www.ietf.org/rfc/rfc2119.txt

[keith\_fahlgren](keith_fahlgren.md) From the EPUB 2.1 Working Group Charter "interactivity (programmatic content, such as would be needed to implement a quiz or crossword puzzle)"

BillM: we should investigate whether under that must we can express limitations on chapter level scripting that are meaningful and verifiable, such as limiting JS to event handlers

[gregory](gregory.md) keith\_fahlgrn, ARIA drag-and-drop example: tick tack toe http://test.cita.illinois.edu/aria/draganddrop/draganddrop1.php

Markus: I don't see this as urgent but OTOH it's a tricky issue, do we have volunteers?

Garth: this is almost getting to solution details

BillM: agree

[keith\_fahlgren](keith_fahlgren.md) I wonder if gregory's drag-and-drop example is "chapter level scripting"

[keith\_fahlgren](keith_fahlgren.md) Any JavaScript which changes the DOM of an OPF spine element.

Peter: any JS which changes the DOM of a document which is referenced in the spine, outside of a sub-document (IFRAME or OBJECT)

Peter: spine docs need to be paginated or scrolled

Markus: canvas?

[gregory](gregory.md) please note that ARIA is not completely script-dependent as is canvas

Peter: if it's in IFRAME then no problem, if it's an element of a spine item then it's chapter-level scripting, You can't embed script in canvas it's only in document

[liza](liza.md) iframe is not part of the DOM?

Markus: Keith, I'm confused, so you're right

[liza](liza.md) I can access the content of an iframe via the DOM

[keith\_fahlgren](keith_fahlgren.md) Right, ARIA brings benefits for improving the declarative semantics of the content even w/o scripting

Gregory: Markus, F2F mtg in Oslo