//
//  ContentView.swift
//  ConfucianClassics
//
//  Created by Ricardo Li on 2022/8/1.
//

import SwiftUI

struct ContentView: View {
    private var books = [
        Book(title: "第一章：论德", content: "上德不德，是以有德。下德不失德；是以无德。上德无为而无以为也。上仁为之，而无以为也；上义为之，而有以为也。上礼为之，而莫之应也，则攘臂而乃之。故失道而后德，失德而后仁，失仁而后义，失义而后礼。夫礼者，忠信之泊也，而乱之首也。前识者，道之华也，而愚之首也。是以大丈夫居其厚，而不居其泊，居其实，而不居其华。故去皮取此。"),
        Book(title: "第二章：得一", content: "昔之得一者，天得一以清，地得一以宁，神得一以灵，浴得一以盈，侯王得一而以为天下正。其至之也。谓天毋已清将恐裂；谓地毋已宁将恐发；谓神毋已灵将愁歇；谓浴毋已盈将恐竭；谓侯王毋已贵以高将恐蹶。故必贵而以贱为本，必高矣而以下为基。夫是以侯王自谓孤、寡、不穀，此其贱之为本与？非也！故致数与无与。是故不欲禄禄若玉，硌硌若石。"),
        Book(title: "第三章：闻道", content: "上士闻道，堇能行之；中士闻道，若存若亡；下士闻道，大笑之，弗笑不足以为道。是以建言有之日：明道如费，进道如退，夷道如类；上德如浴，大白如辱，广德如不足。建德如输，质真如渝，大方无隅；大器晚成，大音希声，大象无形，道隐无名。夫唯道，善始且善成。"),
        Book(title: "第四章：反复", content: "反也者，道之动也;弱也者，道之用也。天下之物生于有，有生于无。"),
        Book(title: "第五章：中和", content: "道生一，一生二，二生三，三生万物。万物负阴而抱阳，中气以为和。天下之所恶，唯孤、寡、不穀，而王公以为自名也。勿或损之而益，或益之而损。觐殷死，议而教人。故强良者不得死，我将以为学父。"),
        Book(title: "第六章：至柔", content: "天下之至柔，驰骋于天下之至坚。无有入于无间。吾是以知无为之有益。不言之教，无为之益，天下希能及之矣。"),
        Book(title: "第七章：立戒", content: "名与身孰亲?身与货孰多?得与亡孰病?甚爱必大费，多藏必厚亡。故知足不辱，知止不殆，可以长久。"),
        Book(title: "第八章：请靓", content: "大成若缺，其用不敝;大盈若冲，其用不穷。大直若诎，大巧若拙，大赢如绌。躁胜寒，靓胜炅。请靓可以为天下正。"),
        Book(title: "第九章：知足", content: "天下有道，却走马以粪。天下无道，戎马生于郊。罪莫大于可欲，祸莫大于不知足，咎莫僭于欲得。故知足之足，恒足矣。"),
        Book(title: "第十章：知天下", content: "不出于户，以知天下。不窥于牖，以知天道。其出也弥远，其知也弥少。是以圣人，不行而知，不见而名，弗为而成。"),
    ]

    var body: some View {
        NavigationView {
            List(books) { book in
                NavigationLink(destination: DetailView(book: book)) {
                    Text(book.title)
                }
            }.navigationBarTitle("德道经")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 详情页面
struct DetailView: View {
    var book: Book

    var body: some View {
        VStack {
            Text(book.content)
                .font(.system(size: 17))
                .lineSpacing(10)
                .padding()
            Spacer()
        }.navigationBarTitle(book.title, displayMode: .inline)
    }
}

struct Book: Identifiable {
    var id = UUID()
    var title: String
    var content: String
}
