import Foundation

struct JournalEntry: Identifiable {
    let id: UUID
    let title: String
    let body: String
    let date: Date

    let author: String?
}

extension JournalEntry {
    init(title: String, body: String, date: Date, author: String?) {
        self.id = .init()
        self.title = title
        self.body = body
        self.date = date
        self.author = author
    }
}

extension JournalEntry {
    // From: https://www.apple.com/newsroom/2007/01/09Apple-Reinvents-the-Phone-with-iPhone/
    // iPhone launch date/time: 2007-01-09 at 09:41:00 PST
    static let preview = JournalEntry(
        id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!,
        title: "Apple Reinvents the Phone with iPhone",
        body: "Apple today introduced iPhone, combining three products—a revolutionary mobile phone, a widescreen iPod with touch controls, and a breakthrough Internet communications device with desktop-class email, web browsing, searching and maps—into one small and lightweight handheld device. iPhone introduces an entirely new user interface based on a large multi-touch display and pioneering new software, letting users control iPhone with just their fingers. iPhone also ushers in an era of software power and sophistication never before seen in a mobile device, which completely redefines what users can do on their mobile phones.",
        date: Date(timeIntervalSince1970: 1168364460),
        author: "John Appleseed"
    )

    // From: Alice's Adventures in Wonderland by Lewis Carroll

    static let preview1 = JournalEntry(
        id: UUID(repeating: "1")!,
        title: "Down the Rabbit Hole",
        body: "Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, 'and what is the use of a book,' thought Alice 'without pictures or conversation?'",
        date: Date(timeIntervalSince1970: -3286465438),
        author: "Lewis Carroll"
    )

    static let preview2 = JournalEntry(
        id: UUID(repeating: "2")!,
        title: "The Pool of Tear",
        body: "'Curiouser and curiouser!' cried Alice (she was so much surprised, that for the moment she quite forgot how to speak good English); 'now I'm opening out like the largest telescope that ever was! Good-bye, feet!' (for when she looked down at her feet, they seemed to be almost out of sight, they were getting so far off). 'Oh, my poor little feet, I wonder who will put on your shoes and stockings for you now, dears? I'm sure I shan't be able! I shall be a great deal too far off to trouble myself about you: you must manage the best way you can;—but I must be kind to them,' thought Alice, 'or perhaps they won't walk the way I want to go! Let me see: I'll give them a new pair of boots every Christmas.'",
        date: Date(timeIntervalSince1970: -3286465438),
        author: "Lewis Carroll"
    )

    static let preview3 = JournalEntry(
        id: UUID(repeating: "3")!,
        title: "A Caucus-Race and a Long Tale",
        body: "They were indeed a queer-looking party that assembled on the bank—the birds with draggled feathers, the animals with their fur clinging close to them, and all dripping wet, cross, and uncomfortable.",
        date: Date(timeIntervalSince1970: -3286465438),
        author: "Lewis Carroll"
    )

    static let preview4 = JournalEntry(
        id: UUID(repeating: "4")!,
        title: "The Rabbit Sends in a Little Bill",
        body: "It was the White Rabbit, trotting slowly back again, and looking anxiously about as it went, as if it had lost something; and she heard it muttering to itself 'The Duchess! The Duchess! Oh my dear paws! Oh my fur and whiskers! She'll get me executed, as sure as ferrets are ferrets! Where CAN I have dropped them, I wonder?' Alice guessed in a moment that it was looking for the fan and the pair of white kid gloves, and she very good-naturedly began hunting about for them, but they were nowhere to be seen—everything seemed to have changed since her swim in the pool, and the great hall, with the glass table and the little door, had vanished completely.",
        date: Date(timeIntervalSince1970: -3286465438),
        author: "Lewis Carroll"
    )

    static let preview5 = JournalEntry(
        id: UUID(repeating: "5")!,
        title: "Advice from a Caterpillar",
        body: "The Caterpillar and Alice looked at each other for some time in silence: at last the Caterpillar took the hookah out of its mouth, and addressed her in a languid, sleepy voice.",
        date: Date(timeIntervalSince1970: -3286465438),
        author: "Lewis Carroll"
    )

    static let preview6 = JournalEntry(
        id: UUID(repeating: "6")!,
        title: "Pig and Pepper",
        body: "For a minute or two she stood looking at the house, and wondering what to do next, when suddenly a footman in livery came running out of the wood—(she considered him to be a footman because he was in livery: otherwise, judging by his face only, she would have called him a fish)—and rapped loudly at the door with his knuckles. It was opened by another footman in livery, with a round face, and large eyes like a frog; and both footmen, Alice noticed, had powdered hair that curled all over their heads. She felt very curious to know what it was all about, and crept a little way out of the wood to listen.",
        date: Date(timeIntervalSince1970: -3286465438),
        author: "Lewis Carroll"
    )

    static let preview7 = JournalEntry(
        id: UUID(repeating: "7")!,
        title: "A Mad Tea-Party",
        body: "There was a table set out under a tree in front of the house, and the March Hare and the Hatter were having tea at it: a Dormouse was sitting between them, fast asleep, and the other two were using it as a cushion, resting their elbows on it, and talking over its head. 'Very uncomfortable for the Dormouse,' thought Alice; 'only, as it's asleep, I suppose it doesn't mind.'",
        date: Date(timeIntervalSince1970: -3286465438),
        author: "Lewis Carroll"
    )

    static let preview8 = JournalEntry(
        id: UUID(repeating: "8")!,
        title: "The Queen's Croquet-Ground",
        body: "A large rose-tree stood near the entrance of the garden: the roses growing on it were white, but there were three gardeners at it, busily painting them red. Alice thought this a very curious thing, and she went nearer to watch them, and just as she came up to them she heard one of them say, 'Look out now, Five! Don't go splashing paint over me like that!'",
        date: Date(timeIntervalSince1970: -3286465438),
        author: "Lewis Carroll"
    )

    static let preview9 = JournalEntry(
        id: UUID(repeating: "9")!,
        title: "The Mock Turtle's Story",
        body: "'You can't think how glad I am to see you again, you dear old thing!' said the Duchess, as she tucked her arm affectionately into Alice's, and they walked off together.",
        date: Date(timeIntervalSince1970: -3286465438),
        author: "Lewis Carroll"
    )

    static let preview10 = JournalEntry(
        id: UUID(repeating: "A")!,
        title: "The Lobster Quadrille",
        body: "The Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. He looked at Alice, and tried to speak, but for a minute or two sobs choked his voice. 'Same as if he had a bone in his throat,' said the Gryphon: and it set to work shaking him and punching him in the back. At last the Mock Turtle recovered his voice, and, with tears running down his cheeks, he went on again:—",
        date: Date(timeIntervalSince1970: -3286465438),
        author: "Lewis Carroll"
    )

    static let preview11 = JournalEntry(
        id: UUID(repeating: "B")!,
        title: "Who Stole the Tarts?",
        body: "The King and Queen of Hearts were seated on their throne when they arrived, with a great crowd assembled about them—all sorts of little birds and beasts, as well as the whole pack of cards: the Knave was standing before them, in chains, with a soldier on each side to guard him; and near the King was the White Rabbit, with a trumpet in one hand, and a scroll of parchment in the other. In the very middle of the court was a table, with a large dish of tarts upon it: they looked so good, that it made Alice quite hungry to look at them—'I wish they'd get the trial done,' she thought, 'and hand round the refreshments!' But there seemed to be no chance of this, so she began looking at everything about her, to pass away the time.",
        date: Date(timeIntervalSince1970: -3286465438),
        author: "Lewis Carroll"
    )

    static let preview12 = JournalEntry(
        id: UUID(repeating: "C")!,
        title: "Alice's Evidence",
        body: "'Here!' cried Alice, quite forgetting in the flurry of the moment how large she had grown in the last few minutes, and she jumped up in such a hurry that she tipped over the jury-box with the edge of her skirt, upsetting all the jurymen on to the heads of the crowd below, and there they lay sprawling about, reminding her very much of a globe of goldfish she had accidentally upset the week before.",
        date: Date(timeIntervalSince1970: -3286465438),
        author: "Lewis Carroll"
    )
}

extension Array where Element == JournalEntry {
    static let previews: [JournalEntry] = [
        .preview1,
        .preview2,
        .preview3,
        .preview4,
        .preview5,
        .preview6,
        .preview7,
        .preview8,
        .preview9,
        .preview10,
        .preview11,
        .preview12,
    ]
}
