Chair: Markus Gylling

Scribe: Bill McCoy

Audio recording: 100825

To listen to the recording, dial in and press star 3



## Attendees ##

Si-Wei, Takeshi, wen-hsuan, mikeidpf, DaveGunn, gc, karenbroome, ChoChin, DanHughes, duga, !MikeW3C, Kyoji, marisa\_demeglio, BillMcCoy, RogerWebster, KingWai, AdamWitwer, danielweck, !NeilS, ShuTanabe, Ryoji\_Akimoto, SteveKotrch, !Mei-Li, mgylling, BillKasdorf

## Action Items (New) ##

None.

## Previous minutes review ##

Approved.

## Previous action item review ##

Markus: first item, annotations help action item - done

Markus: second, Keith to draft guidelines on fwd/back compat. Keith? (not here)

Markus: chair group meeting Fri to talk about next F2F, info out soon

Markus: CSS WG liaison letter - Brady/Garth?

Brady: still being edited

George: willing to take that on, think sending it to Phillipe w/ copies to Michael Smith & J person OK, will work on that in next day or two

Markus: I added ARIA req, link in agenda, ARIA still subject to change in HTML5 & in itself

Marks: version action?

George: BOD unanimously voted 3.0

Garth: I buckled on name, didn't want change to lead to expanded scope or timeline, so motion w/ Board was to use 3.0 moniker w/out altering schedule

Markus: timeline doc on Wiki, that is not impacted by naming. internal WD dates may change, we need editing group first, but major milestones not impacted

## subgroup status - general ##

Markus: this Fri, reqs finalization - we expect the requirements in all subgroups to be complete and represent subgroup & WG view of what we set out to achieve & why

Markus: also with prioritization so we have a logical working order as we start next Monday w/ impl proposal work

## annotations ##

Will: we have straw-man prioritization on Wiki, additional input from Taiwan not reflected yet

Will: urge anyone w/ interest to comment on reqs or on prioritization

Will: Friday is matter of getting further feedback from additional group members

Markus: everyone pls review & send input to list

## EGLS ##

Markus: (Makoto not on call today) - Takeshi going to provide page progression direction req

Takeshi: yes. we haven't talked about prioritization yet

## metadata ##

BillK: prioritization translated to Garth's scheme

BillK: 3 fundamental ways of dealing w/ metadata: in OPF file, inc file (like Onix) in package, or pointing to external source (URI) - consensus on 2, disagreement on 3rd

BillK: going in expected direction of small set of essential metadata that must be in OPF file & larger set that may be in OPF file, straw man suggests fundamental elements from ONIX but point is that they are a couple dozen potential metadata elements that are candidates

BillK: this went out for voting, email to whole list so everyone can vote

BillK: skepticism about external metadata - issues around validation, reliability of link, etc.

BillK: 3rd strategy - let people put additional metadata as e.g. ONIX or PRISM file in package, seems simple but reality is if it's optional it will be ignored

BillK: easy but pointless, if so maybe not worthwhile

## navigation ##

George: stable, only item controversial is simplification route of not including nav or opf, almost a non-req but more in terms of arch/design

Markus: we need to discuss simplification as con call theme, but doesn't pertain to navigation so no need to worry about it

## text content ##

Markus: ARIA has gone in there, primarily pertaining to scripting

Markus: DK from IA has clarified reqs, Takeshi as well, we'll be discussing in subgroup call tmw

## styling & layout ##

Brady: not much change in terms of reqs, no new ones, a little activity fleshing out existing ones w/ examples & use cases

Brady: ranking up in air because not much agreement or discussion (latter my fault) about rankings

Brady: 1-19 stack rank of priorities done based on importance & in scope attempted, folks pls take a look

Brady: do we want results of ranking to be A-F or ???

Markus: Conboy scheme, yes

Brady: from prioritization its harder to go back to Conboy scheme

Markus: if you need to do 1-19 then do it

Garth: isn't it important to have dividing line?

Brady: in scope, least was 57% (hyphenation)

Peter: if serious about dates, then we shouldn't spend time on discussion, but simply defer if there's either not enough interest or

PeterS: or effort spent will not yield enough reward

PeterS: in scope vs. out of scope can take a long time to agree on

Brady: if we can pick up something for not much work then we might want to

PeterS: if someone says we are trying to push some feature and people really think it should not be in scope that's one thing, but not so much wrt prioritization

BillK: as I was working through meta, there's reqs agreed as essential, but could not see how to be in scope, so I marked as out of scope, is that OK even though they are neot in charter?

Garth: A-F is maybe initial votes then we end up with ordered 1-N

BillK: we did opposited, initial ranking then A-F

BillK: it was pretty clear that there was clustering of high vs. mid vs. low (for most votes)

BillK: we then surface that are not technically in charter but cna't imagine we'd put them aside

Garth: a group who used the "Conboy scheme" could end up attacking the "A's, B's and D's" (or some such).

Garth: as long as each subgroup gets an actionable result that's the key thing, not uniformity

Markus: uniformity makes it easy for others to understand, but if it doesn't work use another scheme

## rich media, interactivity & ads ##

Peter: several new reqs, now some of rankings don't include them, more rankings received, didn't add yet, after this call I'll do again

Peter: seems to be a lot of disagreement around ads, whether we should do anything

Peter: people seem to think that synch between audio & text is interesting but not terribly important

Peter: doesn't mean either feature will not be considered but we might need to do something fairly simple in these areas vs. trying to solve every possible problem

## chapter-level scripting ##

Markus: suggestion is we try to identify the problems we want to solve first, then we can try to work more coherently on solutions

Markus: put together a wiki page, some edits have been made, new problem added

Markus: link from agenda, a very drafty scratchpad for keeping thoughts clear

Markus: idea is we will document solutions formally here

Markus: 5 problems listed

Peter: my concern is interoperability, problem is its going to affect pagination differently on different systems

Peter: interoperability is not maximizing, its improving chances of it working

Peter: I want every RS claiming conformant & scripting support would play this particular file

Markus: you said it's a spec issue, you want spec to define exactly the behavior of conformant system?

Peter: no I want to define how to author EPUB so it will work on every RS that supports scripting, you have a way to do it

Peter: if you want to include mortgage calculator, give a way to author so there's a guarantee it will work

Markus: understand

Markus: how relates to problem B, some RS not supporting scirpting at all?

Peter: we want to make it possible to not support scripting

Peter: SVG spec has well-defined notion of RS as interactive & non-interactive, if interactive you have to implement all that stuff

Peter: RS would have to claim to support scripting to do it

Markus: mortgage calc app would have to communicate to consumers that you have to have RS that supports interactivity to enjoy this feature

Peter: there will be RS that don't

Markus: one potential piece of solution is to have varying conformance reqs for interactive & non-interactive RS

Markus: spec would have to define

Peter: we can go a step further, though it's complex, and say that because scripting implies browsers, we can say if your platform has a browser then you must support interactivity

Peter: hard or meaningless in practice

BillM: SVG had this non-interactive partly for printing (paper can't run the mortage calculator, not yet anyway)

Markus: script conflicts covered in E?

BillM: yes, it could be separate but it's there

Markus: any problem we should remove?

Markus: Peter will replace D

Markus: lets not go into solutions today, but note in A-1 I took try to synthesize suggestions inc. from Apple

Markus: please read through it, I understand now it's not just a solution to A but perhaps others inc E

Markus: Peter may want to editc

Markus: Brady's suggestion in B-1 about having spec require that only progressive enhancement type scripting shoudl be used

Markus: re: accessibility, we are saying we aren't trying to do additional beyond ARIA etc.

Markus: next steps is to flesh out solutions list here and OK to have several competing ones - pls anyone add suggestions idea


## CSS3 relations ##

JOINED: [NeilS](NeilS.md) [2010/08/25 14:43:39]

Markus: we have solution for HTML5 wrt late binding, now need a solution for CSS3

Brady: as intro, there are 2 problems - wiki only talks of 1 - how are we going to take styling capabilities from CSS3 when modules are in varying states of completeness, none truly complete?

Brady: multiple cols, @media, are at Cand Rec and progressing, not squirming much

Brady: but text layout is only editors draft, maybe not even officially that - WIP and nowhere near completion

Brady: but there are things we need there, like vertical text specification, that's what's talked about on the wiki page

Brady: CSS relations may be poor name because some solutions are to use something other than CSS

Brady: solution of just citing CSS3 wholesale is not reasonable

Peter: and doing so isn't an option, it would drain batteries

Brady: can't even just point at portions of CSS3 and be done, we have more to do

Peter: I ask people in technical discussions not to use the term CSS3, either refer to feature or module, there's no such thing as CSS3 per se

Peter: there is more not in common between differnent modules of CSS3 than in common

Peter: dealing w/ CSS3 isn't a meaningful topic

Brady: some things we can potentially pull from CSS3 (modules]) some we can't

Peter: there is no way to do a wholesale decision

Brady: those things we decide we can't "pluck" from CSS we have to decide what to do

Brady: may be package-level styling appropriate in one case, a whole new styling language in another case

Peter: not excited about a non-CSS style solution, I don't think it's terribly useful to use non-CSS framework

Peter: I don't know of anything useful

Markus: why would moving away from CSS be useful?

Brady: we should be careful, there are some solutions that don't move us away from CSS in the long term

Brady: one approach to vertical text is to say "this document should be displayed vertically" and when CSS gets its act together we can have that be an additional mean3s

Brady: another solution would use classes

Brady: again could be replaced w/ CSS later

Brady: don't know how reasonable it is to dump CSS & use something else

Markus: as opposed to HTML5, one-stop-shop is not the case here

Markus: feature by feature we have to pick the most suitable solution

Brady: we might want to limit solutions we want to consider

Markus: are there CSS modules/features that we need, that already have enough implementations that they can be assumed to be stable

Brady: yes, e.g. multcolumn & media queries, possibly others

Peter: maybe only some features from these, not every property is implemented by anyone

Markus: not on a module level

Peter: media-queries is pretty stable, not even sure why still CR, but doesn't do everything we need unfortunately

Brady: no it does not

Markus: assuming we find modules or fragments, which solution do we pick - B?

Peter: another solution is to put our own @ rule in there

Peter: that would let us distinguish our own solutions later if necessary

Brady: if W3C says fine, then maybe

Peter: W3C says that's the way to do things, it's totally guaranteed to work w/ systems that don't understand them

Brady: once a spec reaches some level (CR?) impls were no longer required to have vendor prefixes, if that were the case (not sure), then we could use those things that had reached CR level

Peter: but we are a spec not an impl

Brady: says it should not be referenced, not can't reference

Brady: can reference a specific version w/ a link or copy of that specific draft

Brady: e.g. col-count as defined here...

Peter: nervous about that

Brady: otherwise you end up in the vendor prefix nightmare

Peter: another way is to have something in stylesheet, like link element or mime type, saying if you use IDPF mime type you get extra properties

Peter: some browsers seem to ignore mime type on style sheet - if it looks like CSS it works

Brady: for things that are nearly done we have 3 potential solutions: @ media, our own prefix, or just use directly

Markus: should that be used consistently?

Peter: I don't see any difference between using property or at rule, they are different syntax creatures but you can have extensions for either of them

Brady: if we pick one of those 3 solutions we can solve first problem

Markus: any of these 3 solutions you don't have a problem with

Peter: I only have a problem with referencing them directly in our spec

BillM: if things are supported in browsers w/out extensions then we will look silly if we make authors tack on IDPF prefixes, just because the specs are still candidate recommendations.

Brady: CSS 2.1 still CR no one puts on prefixes to use in browsers

Peter: but this is about referencing in our spec, that's different than browser behavior.

Brady: W3C doesn't get to set our document statuses

Brady: another question is how we deal w/ cases where things are nowhere near complete, that's a different issue than things at CR.