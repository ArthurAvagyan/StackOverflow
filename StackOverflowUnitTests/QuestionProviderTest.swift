//
//  QuestionProviderTest.swift
//  StackOverflowUnitTests
//
//  Created by Arthur on 10.12.23.
//

import XCTest
@testable import StackOverflow

//extension QuestionModel {
//	
//	static let mock = QuestionModel(acceptedAnswerId: nil,
//									answerCount: 2,
//									bountyAmount: nil,
//									closedReason: nil,
//									collectives: nil,
//									isAnswered: true,
//									link: URL(string: "https://stackoverflow.com/questions/66419728/how-do-i-unit-test-protocol-and-its-extension")!,
//									owner: .init(acceptRate: nil, accountId: nil, displayName: nil, link: nil, profileImage: nil, reputation: nil, userId: nil, userType: .registered),
//									postedByCollectives: nil,
//									questionId: 1,
//									score: 2,
//									tags: nil,
//									title: "le tittle",
//									viewCount: 0)
//	
//}
//
//final class DataManagerMock: QuestionProvider {
//	
//	var getAllQuestionsReturnValue = ItemsModel<QuestionModel>(items: [.mock, .mock, .mock])
//
//	func getAllQuestions(page: Int, _ completion: @escaping (ItemsModel<QuestionModel>) -> ()) {
//		completion(getAllQuestionsReturnValue)
//	}
//}


final class NetworkingMock: Networkable {
	private(set) var getEndpointValue: StackOverflow.Endpoint?
	private(set) var getQueryItems: [URLQueryItem]?
	
	func get<T>(form endpoint: Endpoint, with queryItems: [URLQueryItem]?, _ completion: @escaping (T) -> (), _ failure: ((Error) -> ())?) where T : Decodable {
		
		getEndpointValue = endpoint
		getQueryItems = queryItems
		let string = "{\"items\":[{\"tags\":[\"javascript\",\"jquery\"],\"owner\":{\"account_id\":3398430,\"reputation\":54,\"user_id\":13296426,\"user_type\":\"registered\",\"profile_image\":\"https://www.gravatar.com/avatar/65b2d5c41ad8bf51658052d92242afda?s=256&d=identicon&r=PG&f=y&so-version=2\",\"display_name\":\"Notion\",\"link\":\"https://stackoverflow.com/users/13296426/notion\"},\"is_answered\":false,\"view_count\":4,\"answer_count\":0,\"score\":0,\"last_activity_date\":1702214296,\"creation_date\":1702214296,\"question_id\":77634957,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634957/javascript-not-showing-right-message-at-right-momernt\",\"title\":\"javascript not showing right message at right momernt\"},{\"tags\":[\"symfony\",\"symfony-security\"],\"owner\":{\"account_id\":10472275,\"reputation\":577,\"user_id\":7719790,\"user_type\":\"registered\",\"accept_rate\":0,\"profile_image\":\"https://www.gravatar.com/avatar/efa4fd8a34f25285436a39204276637c?s=256&d=identicon&r=PG&f=y&so-version=2\",\"display_name\":\"N. M.\",\"link\":\"https://stackoverflow.com/users/7719790/n-m\"},\"is_answered\":true,\"view_count\":3794,\"accepted_answer_id\":54986369,\"answer_count\":2,\"score\":2,\"last_activity_date\":1702214296,\"creation_date\":1551436217,\"last_edit_date\":1551446820,\"question_id\":54942711,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/54942711/traceablefirewalllistener-extremely-long-loading-time\",\"title\":\"TraceableFirewallListener extremely long loading time\"},{\"tags\":[\"amazon-web-services\",\"amazon-s3\",\"aws-lambda\",\"aws-cloudformation\"],\"owner\":{\"user_type\":\"does_not_exist\",\"display_name\":\"user3002273\"},\"is_answered\":true,\"view_count\":15852,\"accepted_answer_id\":46854663,\"answer_count\":5,\"score\":8,\"last_activity_date\":1702214260,\"creation_date\":1508520431,\"last_edit_date\":1634329185,\"question_id\":46854316,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/46854316/cloudformation-template-to-trigger-lambda-on-s3-event\",\"title\":\"Cloudformation template to trigger Lambda on S3 event\"},{\"tags\":[\"python\",\"performance\",\"cpython\",\"python-internals\"],\"owner\":{\"account_id\":17476274,\"reputation\":24816,\"user_id\":12671057,\"user_type\":\"registered\",\"profile_image\":\"https://www.gravatar.com/avatar/90d2e6942c69df199a95d06e0c8e9a10?s=256&d=identicon&r=PG&f=y&so-version=2\",\"display_name\":\"Kelly Bundy\",\"link\":\"https://stackoverflow.com/users/12671057/kelly-bundy\"},\"is_answered\":false,\"view_count\":3,\"answer_count\":0,\"score\":0,\"last_activity_date\":1702214257,\"creation_date\":1702214257,\"question_id\":77634955,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634955/why-is-the-simpler-loop-slower\",\"title\":\"Why is the simpler loop slower?\"},{\"tags\":[\"java\",\"jframe\",\"jpanel\",\"imageicon\"],\"owner\":{\"account_id\":30109641,\"reputation\":1,\"user_id\":23074496,\"user_type\":\"registered\",\"profile_image\":\"https://i.stack.imgur.com/0OOBp.png?s=256&g=1\",\"display_name\":\"Thwoopster\",\"link\":\"https://stackoverflow.com/users/23074496/thwoopster\"},\"is_answered\":false,\"view_count\":19,\"answer_count\":1,\"score\":-1,\"last_activity_date\":1702214254,\"creation_date\":1702196485,\"question_id\":77634130,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634130/i-cant-get-the-imageicon-to-display-properly\",\"title\":\"I can&#39;t get the ImageIcon to display properly\"},{\"tags\":[\"r\",\"r-forestplot\",\"forest-plots\"],\"owner\":{\"account_id\":30108706,\"reputation\":1,\"user_id\":23073804,\"user_type\":\"registered\",\"profile_image\":\"https://lh3.googleusercontent.com/a/ACg8ocIqF-qgjqpLd5-HDN0ELOFo9K5VjzJN6jc27UPYuOl-5g=k-s256\",\"display_name\":\"Ningbin Huang\",\"link\":\"https://stackoverflow.com/users/23073804/ningbin-huang\"},\"is_answered\":false,\"view_count\":19,\"answer_count\":0,\"score\":0,\"last_activity_date\":1702214236,\"creation_date\":1702181934,\"last_edit_date\":1702214236,\"question_id\":77633657,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77633657/how-to-show-the-value-of-z-in-the-forest-plot-meta\",\"title\":\"How to show the value of Z in the forest plot？ (Meta)\"},{\"tags\":[\"c++\",\"file\"],\"owner\":{\"account_id\":30111286,\"reputation\":1,\"user_id\":23075750,\"user_type\":\"registered\",\"profile_image\":\"https://lh3.googleusercontent.com/a/ACg8ocJbK3ns8Nk-bZI6dMJ0HGDDhxK0hAVppHIVafK3tE6F8g=k-s256\",\"display_name\":\"Dani\",\"link\":\"https://stackoverflow.com/users/23075750/dani\"},\"is_answered\":false,\"view_count\":6,\"answer_count\":0,\"score\":0,\"last_activity_date\":1702214232,\"creation_date\":1702214232,\"question_id\":77634953,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634953/how-do-i-make-and-edit-a-list\",\"title\":\"How do I make and edit a list?\"},{\"tags\":[\"python\"],\"owner\":{\"account_id\":14226912,\"reputation\":143,\"user_id\":10277323,\"user_type\":\"registered\",\"profile_image\":\"https://lh3.googleusercontent.com/-PAXtGXwUxbA/AAAAAAAAAAI/AAAAAAAAAAA/APUIFaM_RucJv2s-NlEOh9d81U5myyWKcg/mo/photo.jpg?sz=256\",\"display_name\":\"PaCi\",\"link\":\"https://stackoverflow.com/users/10277323/paci\"},\"is_answered\":true,\"view_count\":12452,\"accepted_answer_id\":57910048,\"answer_count\":6,\"score\":5,\"last_activity_date\":1702214210,\"creation_date\":1568302075,\"question_id\":57910021,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/57910021/how-to-pass-python-list-of-string-to-sql-query\",\"title\":\"How to pass python list of string to sql query\"},{\"tags\":[\"javascript\",\"html\",\"css\",\"discord\"],\"owner\":{\"account_id\":22319781,\"reputation\":155,\"user_id\":16542571,\"user_type\":\"registered\",\"profile_image\":\"https://i.stack.imgur.com/Khc4A.jpg?s=256&g=1\",\"display_name\":\"unofficialdxnny\",\"link\":\"https://stackoverflow.com/users/16542571/unofficialdxnny\"},\"is_answered\":false,\"view_count\":150,\"answer_count\":1,\"score\":-2,\"last_activity_date\":1702214209,\"creation_date\":1667076535,\"last_edit_date\":1667076919,\"question_id\":74248718,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/74248718/can-i-replicate-discord-activity-status-on-my-website-with-just-frontend\",\"title\":\"Can I replicate discord activity status on my website with just frontend?\"},{\"tags\":[\"linux\",\"x11\",\"xlib\",\"xcb\",\"icccm\"],\"owner\":{\"account_id\":2310719,\"reputation\":6905,\"user_id\":2028907,\"user_type\":\"registered\",\"accept_rate\":82,\"profile_image\":\"https://i.stack.imgur.com/R81XM.png?s=256&g=1\",\"display_name\":\"johnfound\",\"link\":\"https://stackoverflow.com/users/2028907/johnfound\"},\"is_answered\":false,\"view_count\":29,\"answer_count\":1,\"score\":0,\"last_activity_date\":1702214201,\"creation_date\":1702132863,\"question_id\":77631657,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77631657/strange-problem-with-x11-positioning-of-the-windows-and-window-manager-interacti\",\"title\":\"Strange problem with X11 positioning of the windows and window manager interactions\"},{\"tags\":[\"javascript\",\"jquery\",\"asp.net-core-mvc\"],\"owner\":{\"account_id\":4488809,\"reputation\":549,\"user_id\":3650516,\"user_type\":\"registered\",\"accept_rate\":96,\"profile_image\":\"https://www.gravatar.com/avatar/3557e414e6635d57453f991678b2e195?s=256&d=identicon&r=PG&f=y&so-version=2\",\"display_name\":\"M_Griffiths\",\"link\":\"https://stackoverflow.com/users/3650516/m-griffiths\"},\"is_answered\":false,\"view_count\":20,\"answer_count\":1,\"score\":0,\"last_activity_date\":1702214191,\"creation_date\":1702203764,\"question_id\":77634416,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634416/jquery-code-is-not-defined-function-not-being-triggered\",\"title\":\"JQuery code is not defined. Function not being triggered\"},{\"tags\":[\"java\",\"spring\"],\"owner\":{\"account_id\":336191,\"reputation\":1069,\"user_id\":1458562,\"user_type\":\"registered\",\"profile_image\":\"https://www.gravatar.com/avatar/58233cd4deb59e46a4f6bfe6e9a1af4f?s=256&d=identicon&r=PG\",\"display_name\":\"Patrice Blanchardie\",\"link\":\"https://stackoverflow.com/users/1458562/patrice-blanchardie\"},\"is_answered\":false,\"view_count\":9,\"answer_count\":0,\"score\":0,\"last_activity_date\":1702214188,\"creation_date\":1702213129,\"last_edit_date\":1702214188,\"question_id\":77634880,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634880/classloader-unexpectedly-changes\",\"title\":\"ClassLoader unexpectedly changes\"},{\"tags\":[\"javascript\",\"logging\",\"terminal\",\"pino\"],\"owner\":{\"account_id\":20653762,\"reputation\":142,\"user_id\":15163418,\"user_type\":\"registered\",\"profile_image\":\"https://lh3.googleusercontent.com/a-/AOh14GhlRrzVeryiQ83girU3jubcDBk1jNYeB-b8VTbcFA=k-s256\",\"display_name\":\"Raghavan Vidhyasagar\",\"link\":\"https://stackoverflow.com/users/15163418/raghavan-vidhyasagar\"},\"is_answered\":false,\"view_count\":6,\"answer_count\":0,\"score\":0,\"last_activity_date\":1702214171,\"creation_date\":1702214171,\"question_id\":77634948,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634948/how-to-colorize-objects-in-pino\",\"title\":\"How to colorize objects in pino\"},{\"tags\":[\"python\",\"pandas\",\"ms-access\",\"sqlalchemy\",\"pyodbc\"],\"owner\":{\"account_id\":29783821,\"reputation\":41,\"user_id\":22825651,\"user_type\":\"registered\",\"profile_image\":\"https://i.stack.imgur.com/PPGdM.jpg?s=256&g=1\",\"display_name\":\"NICK_CS\",\"link\":\"https://stackoverflow.com/users/22825651/nick-cs\"},\"is_answered\":true,\"view_count\":30,\"accepted_answer_id\":77634833,\"answer_count\":2,\"score\":0,\"last_activity_date\":1702214171,\"creation_date\":1702192972,\"last_edit_date\":1702200561,\"question_id\":77634000,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634000/import-excel-data-into-ms-access-using-python\",\"title\":\"import excel data into ms access using python\"},{\"tags\":[\"fido\"],\"owner\":{\"account_id\":1617417,\"reputation\":5092,\"user_id\":1494725,\"user_type\":\"registered\",\"accept_rate\":71,\"profile_image\":\"https://www.gravatar.com/avatar/eb1f15110349cc3c1180d3f70fd10fbf?s=256&d=identicon&r=PG\",\"display_name\":\"aryzing\",\"link\":\"https://stackoverflow.com/users/1494725/aryzing\"},\"is_answered\":false,\"view_count\":3,\"answer_count\":0,\"score\":0,\"last_activity_date\":1702214161,\"creation_date\":1702214161,\"question_id\":77634946,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634946/can-a-web-extension-be-used-as-an-authenticator-for-fido\",\"title\":\"Can a web extension be used as an authenticator for FIDO?\"},{\"tags\":[\"dns\",\"aws-amplify\"],\"owner\":{\"account_id\":20870910,\"reputation\":113,\"user_id\":15330887,\"user_type\":\"registered\",\"profile_image\":\"https://www.gravatar.com/avatar/3386feec43ef0cce9cb3a78f3976874e?s=256&d=identicon&r=PG&f=y&so-version=2\",\"display_name\":\"Kakamotobi\",\"link\":\"https://stackoverflow.com/users/15330887/kakamotobi\"},\"is_answered\":false,\"view_count\":3,\"answer_count\":0,\"score\":0,\"last_activity_date\":1702214139,\"creation_date\":1702214139,\"question_id\":77634945,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634945/how-to-maintain-custom-domain-in-the-address-bar-ft-godaddy-aws-amplify\",\"title\":\"How to maintain custom domain in the address bar ft. GoDaddy, AWS Amplify\"},{\"tags\":[\"c\",\"strict-aliasing\"],\"owner\":{\"account_id\":29885767,\"reputation\":1,\"user_id\":22903339,\"user_type\":\"registered\",\"profile_image\":\"https://www.gravatar.com/avatar/5df500e5cf3eba43ebcd7a28e7af6a5e?s=256&d=identicon&r=PG&f=y&so-version=2\",\"display_name\":\"user22903339\",\"link\":\"https://stackoverflow.com/users/22903339/user22903339\"},\"is_answered\":true,\"view_count\":43,\"answer_count\":2,\"score\":0,\"last_activity_date\":1702214100,\"creation_date\":1702211575,\"question_id\":77634803,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634803/does-casting-a-char-to-another-pointer-type-break-the-strict-aliasing-rule-whe\",\"title\":\"Does casting a char * to another pointer type break the strict aliasing rule when the memory is from malloc?\"},{\"tags\":[\"android\",\"android-layout\",\"bottom-sheet\",\"android-bottomsheetdialog\"],\"owner\":{\"account_id\":5644605,\"reputation\":341,\"user_id\":4467171,\"user_type\":\"registered\",\"profile_image\":\"https://www.gravatar.com/avatar/308b9cab1cb29b40dc88b2350d246909?s=256&d=identicon&r=PG&f=y&so-version=2\",\"display_name\":\"Miha M\",\"link\":\"https://stackoverflow.com/users/4467171/miha-m\"},\"is_answered\":false,\"view_count\":21,\"answer_count\":1,\"score\":0,\"last_activity_date\":1702214074,\"creation_date\":1702203040,\"last_edit_date\":1702214074,\"question_id\":77634388,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634388/android-bottomsheetdialog-with-edittext-remove-background-under-keyboard\",\"title\":\"Android BottomSheetDialog with EditText (Remove background under keyboard)\"},{\"tags\":[\"c#\",\"wpf\",\"xaml\",\".net-7.0\"],\"owner\":{\"account_id\":140870,\"reputation\":9817,\"user_id\":347484,\"user_type\":\"registered\",\"accept_rate\":98,\"profile_image\":\"https://i.stack.imgur.com/H60ZG.jpg?s=256&g=1\",\"display_name\":\"Boppity Bop\",\"link\":\"https://stackoverflow.com/users/347484/boppity-bop\"},\"is_answered\":false,\"view_count\":123,\"answer_count\":1,\"score\":-14,\"last_activity_date\":1702214066,\"creation_date\":1686036807,\"last_edit_date\":1702214066,\"question_id\":76412350,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/76412350/create-horizontal-items-control-combobox-in-wpf\",\"title\":\"Create horizontal items control / combobox in WPF\"},{\"tags\":[\"javascript\",\"jquery\",\"ajax\",\"dom\"],\"owner\":{\"account_id\":13830465,\"reputation\":61,\"user_id\":9983506,\"user_type\":\"registered\",\"profile_image\":\"https://www.gravatar.com/avatar/9d0b311f8950aa601d63a782d8b2920e?s=256&d=identicon&r=PG&f=y&so-version=2\",\"display_name\":\"SinfonierDominante\",\"link\":\"https://stackoverflow.com/users/9983506/sinfonierdominante\"},\"is_answered\":false,\"view_count\":6,\"answer_count\":0,\"score\":0,\"last_activity_date\":1702214054,\"creation_date\":1702214054,\"question_id\":77634944,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634944/get-dom-from-external-page-using-ajax-after-1-second\",\"title\":\"Get DOM from external page using AJAX after 1 second\"},{\"tags\":[\"javascript\",\"timer\",\"countdown\"],\"owner\":{\"account_id\":4262953,\"reputation\":61,\"user_id\":3486844,\"user_type\":\"registered\",\"profile_image\":\"https://graph.facebook.com/692597497/picture?type=large\",\"display_name\":\"user3486844\",\"link\":\"https://stackoverflow.com/users/3486844/user3486844\"},\"is_answered\":true,\"view_count\":31168,\"answer_count\":4,\"score\":5,\"last_activity_date\":1702214048,\"creation_date\":1396385486,\"question_id\":22796620,\"content_license\":\"CC BY-SA 3.0\",\"link\":\"https://stackoverflow.com/questions/22796620/multiple-countdown-timers-on-one-page\",\"title\":\"Multiple countdown timers on one page\"},{\"tags\":[\"reactjs\",\"fastapi\",\"vercel\"],\"owner\":{\"account_id\":25677430,\"reputation\":25,\"user_id\":19440644,\"user_type\":\"registered\",\"profile_image\":\"https://www.gravatar.com/avatar/8660adca35c27eb426fd0922895e7d45?s=256&d=identicon&r=PG\",\"display_name\":\"Blog Kh&#243;a Học\",\"link\":\"https://stackoverflow.com/users/19440644/blog-kh%c3%b3a-h%e1%bb%8dc\"},\"is_answered\":false,\"view_count\":5,\"answer_count\":0,\"score\":0,\"last_activity_date\":1702214027,\"creation_date\":1702214027,\"question_id\":77634942,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634942/error-500-when-calling-post-method-using-fastapi-on-vercel\",\"title\":\"Error 500 when calling Post method using FastApi on Vercel\"},{\"tags\":[\"php\",\"laravel\",\"laravel-websockets\"],\"owner\":{\"account_id\":16483041,\"reputation\":1,\"user_id\":11909254,\"user_type\":\"registered\",\"profile_image\":\"https://graph.facebook.com/2313068518747567/picture?type=large\",\"display_name\":\"Amir Eix\",\"link\":\"https://stackoverflow.com/users/11909254/amir-eix\"},\"is_answered\":false,\"view_count\":5,\"answer_count\":0,\"score\":0,\"last_activity_date\":1702214018,\"creation_date\":1702214018,\"question_id\":77634941,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634941/using-laravel-websockets-in-two-websites-on-deployment-on-the-same-server\",\"title\":\"using Laravel-websockets in two websites on deployment on the same server\"},{\"tags\":[\"node.js\",\"react-hooks\",\"jsx\"],\"owner\":{\"account_id\":30084800,\"reputation\":11,\"user_id\":23055595,\"user_type\":\"registered\",\"profile_image\":\"https://www.gravatar.com/avatar/0d34fcbde0ff869b6d1034847626aa48?s=256&d=identicon&r=PG&f=y&so-version=2\",\"display_name\":\"levi\",\"link\":\"https://stackoverflow.com/users/23055595/levi\"},\"is_answered\":false,\"view_count\":11,\"answer_count\":1,\"score\":1,\"last_activity_date\":1702214016,\"creation_date\":1702213034,\"question_id\":77634876,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634876/something-wrong-with-my-react-useparam-node-js-code\",\"title\":\"Something wrong with my React UseParam &amp; node.js code\"},{\"tags\":[\"c++\",\"oop\",\"runtime-error\",\"cl\"],\"owner\":{\"account_id\":26085922,\"reputation\":1,\"user_id\":19783450,\"user_type\":\"registered\",\"profile_image\":\"https://lh3.googleusercontent.com/a/AItbvmkj_Do24QNxFsrEmcGVbmleZ0nFbGAzvTvfJb28=k-s256\",\"display_name\":\"karkar \",\"link\":\"https://stackoverflow.com/users/19783450/karkar\"},\"is_answered\":false,\"view_count\":33,\"closed_date\":1702213885,\"answer_count\":0,\"score\":-3,\"last_activity_date\":1702214012,\"creation_date\":1702212629,\"last_edit_date\":1702214012,\"question_id\":77634847,\"link\":\"https://stackoverflow.com/questions/77634847/how-to-change-a-the-vtable-address-size-from-4-to-8\",\"closed_reason\":\"Needs details or clarity\",\"title\":\"How to change a the vtable address size from 4 to 8?\"},{\"tags\":[\"reactjs\",\"github-pages\"],\"owner\":{\"account_id\":30111280,\"reputation\":1,\"user_id\":23075745,\"user_type\":\"registered\",\"profile_image\":\"https://www.gravatar.com/avatar/601065d6fc1e7a56873f2841a861a115?s=256&d=identicon&r=PG&f=y&so-version=2\",\"display_name\":\"Divya\",\"link\":\"https://stackoverflow.com/users/23075745/divya\"},\"is_answered\":false,\"view_count\":4,\"answer_count\":0,\"score\":0,\"last_activity_date\":1702214010,\"creation_date\":1702214010,\"question_id\":77634939,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634939/failed-to-load-resources-status-404-gh-pages\",\"title\":\"Failed to load resources, status 404 gh-pages\"},{\"tags\":[\"php\",\"database\",\"laravel\"],\"owner\":{\"account_id\":22576418,\"reputation\":21,\"user_id\":16761802,\"user_type\":\"registered\",\"profile_image\":\"https://lh3.googleusercontent.com/a/AATXAJyId26M9_klufauzwF21WaH7vCAqiuyIgLIMd1w=k-s256\",\"display_name\":\"olorin viggo\",\"link\":\"https://stackoverflow.com/users/16761802/olorin-viggo\"},\"is_answered\":true,\"view_count\":1925,\"answer_count\":4,\"score\":0,\"last_activity_date\":1702214000,\"creation_date\":1630414783,\"last_edit_date\":1630414999,\"question_id\":68999139,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/68999139/route-product-details-uri-product-slug-missing-parameter-slug-error-in-lar\",\"title\":\"Route: product.details URI: product/{slug} Missing parameter: slug] error in Laravel\"},{\"tags\":[\"react-router\",\"react-router-dom\"],\"owner\":{\"account_id\":24546512,\"reputation\":13,\"user_id\":18456289,\"user_type\":\"registered\",\"profile_image\":\"https://i.stack.imgur.com/lsp0c.jpg?s=256&g=1\",\"display_name\":\"swdRana\",\"link\":\"https://stackoverflow.com/users/18456289/swdrana\"},\"is_answered\":false,\"view_count\":4,\"answer_count\":0,\"score\":0,\"last_activity_date\":1702213994,\"creation_date\":1702213994,\"question_id\":77634937,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77634937/react-router-dom-v6-automatic-scroll-to-top-not-working\",\"title\":\"React Router Dom v6: automatic scroll to top not working\"},{\"tags\":[\"javascript\",\"python\",\"html\",\"css\"],\"owner\":{\"account_id\":30109833,\"reputation\":1,\"user_id\":23074643,\"user_type\":\"registered\",\"profile_image\":\"https://lh3.googleusercontent.com/a/ACg8ocLAetnXQp__cZjZvFk7J11Q6cmaq-RoNOr0FGpVTWFt=k-s256\",\"display_name\":\"Yogita Yadav\",\"link\":\"https://stackoverflow.com/users/23074643/yogita-yadav\"},\"is_answered\":false,\"view_count\":10,\"closed_date\":1702214183,\"answer_count\":0,\"score\":-1,\"last_activity_date\":1702213975,\"creation_date\":1702213975,\"question_id\":77634936,\"link\":\"https://stackoverflow.com/questions/77634936/create-a-class-named-person-with-firstname-and-lastname-properties-and-a-print\",\"closed_reason\":\"Needs details or clarity\",\"title\":\"Create a class named Person, with firstname and lastname properties, and a printname method:\"},{\"tags\":[\"ansible\",\"yaml\"],\"owner\":{\"account_id\":4725913,\"reputation\":37,\"user_id\":3822558,\"user_type\":\"registered\",\"profile_image\":\"https://www.gravatar.com/avatar/364bc2616a02a87c333b6c4554feea96?s=256&d=identicon&r=PG&f=y&so-version=2\",\"display_name\":\"user3822558\",\"link\":\"https://stackoverflow.com/users/3822558/user3822558\"},\"is_answered\":false,\"view_count\":32,\"answer_count\":1,\"score\":-2,\"last_activity_date\":1702213973,\"creation_date\":1702067717,\"last_edit_date\":1702211159,\"question_id\":77629047,\"content_license\":\"CC BY-SA 4.0\",\"link\":\"https://stackoverflow.com/questions/77629047/setting-up-conditional-loop-in-ansible-but-receiving-undefined-error\",\"title\":\"Setting up conditional loop in Ansible but receiving undefined error\"}],\"has_more\":true,\"quota_max\":300,\"quota_remaining\":290}"

		let data = Data(string.utf8)
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		let model = try! decoder.decode(T.self, from: data)
		
		completion(model)
	}
}


final class QuestionProviderTest: XCTestCase {

	var questionManager: QuestionProvider!
	var networking: NetworkingMock!

    override func setUp() {
		networking = NetworkingMock()
		questionManager = DataManager(networking: networking)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testGetAllQuestions() {
		// Given
		XCTAssertNil(networking.getQueryItems)
		XCTAssertNil(networking.getEndpointValue)
		var page = 10
		var hasCompletionCalled = false
		
		// When
		questionManager.getAllQuestions(page: page) { _ in
			hasCompletionCalled = true
		}
		
		// Then
		XCTAssertEqual(networking.getQueryItems, [
			URLQueryItem(name: "order", value: "desc"),
			URLQueryItem(name: "sort", value: "activity"),
			URLQueryItem(name: "site", value: "stackoverflow"),
			URLQueryItem(name: "page", value: "\(page)")
		])
		XCTAssertEqual(networking.getEndpointValue, .questions)
		XCTAssertTrue(hasCompletionCalled)
	}
}
