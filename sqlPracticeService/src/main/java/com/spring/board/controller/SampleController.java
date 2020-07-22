package com.spring.board.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.ChatDto;
import com.spring.board.JProblemDAO;
import com.spring.board.JProblemDto;
import com.spring.board.MemberDAO;
import com.spring.board.MemberDto;
import com.spring.board.ProblemDAO;
import com.spring.board.ProblemDto;
import com.spring.board.QuestionCommentDAO;
import com.spring.board.QuestionCommentDto;
import com.spring.board.QuestionDAO;
import com.spring.board.QuestionDto;
import com.spring.board.SubmitLogDAO;
import com.spring.board.SubmitLogDto;

@Controller
@RequestMapping(value = "/sample")
public class SampleController {
	String msg;

	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}

	@RequestMapping(value = "/")
	public String getHome(Model model, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		ProblemDAO pd = ProblemDAO.getInstance();
		ArrayList<ProblemDto> list = pd.select_all();
		JProblemDAO jpd = JProblemDAO.getInstance();
		ArrayList<JProblemDto> jlist = jpd.select_all();

		model.addAttribute("jlist", jlist);
		model.addAttribute("list", list);
//		for(int i=0;i<list.size();i++) {
//			System.out.println(i +"="+list.get(i).getP_title());
//		}
		return "home";
	}

	@RequestMapping(value = "/login")
	public String getLogin(Model model, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		model.addAttribute("memberDto", new MemberDto());
		System.out.println("로그인하러옴");
		return "login";
	}

	@RequestMapping(value = "/post")
	public String getPost(Model model, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		System.out.println("포스트");
		return "post";
	}

	@RequestMapping(value = "/login.do")
	public String doLogin(MemberDto member, HttpServletRequest request) throws Exception {
		MemberDAO md = MemberDAO.getInstance();
		MemberDto mem = md.memberSearch(member);
		System.out.println(member.getPw());
		System.out.println("=" + mem.getPw());

		if (mem.getPw().equals(member.getPw())) {
			HttpSession session = request.getSession();
			session.setAttribute("member", mem);
		}
		return "redirect:/sample/";
	}

	@RequestMapping(value = "/join")
	public String getJoin(Model model, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		model.addAttribute("memberDto", new MemberDto());

		return "joinForm";
	}

	@RequestMapping(value = "/join.do")
	public String doJoin(@ModelAttribute MemberDto mem, HttpServletResponse reponse) throws Exception {
		// db�� ȸ������
		MemberDAO ma = MemberDAO.getInstance();
		if (ma.insert_user(mem)) {
			System.out.println("아이디 생성 성공");
		} else {
			System.out.println("ID or Phone 중복");
		}

		return "redirect:/sample/";
	}

	@RequestMapping(value = "/mypage")
	public String getMypage(Model model, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		HttpSession session = request.getSession();
		MemberDto mDto = (MemberDto) session.getAttribute("member");
		MemberDAO mDAO = MemberDAO.getInstance();
		mDto = mDAO.memberSearch(mDto);
		model.addAttribute("member", mDto);
		return "mypage";
	}

	@RequestMapping(value = "/problem")
	public String getProblem(Model model, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		String p_no = request.getParameter("p_no");
		System.out.println(p_no);
		ProblemDAO pd = ProblemDAO.getInstance();
		ProblemDto dto = pd.select_num(p_no);
		model.addAttribute("pro", dto);

		return "problem";
	}

	@RequestMapping(value = "/jproblem")
	public String getJProblem(Model model, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		String p_no = request.getParameter("p_no");
		System.out.println(p_no);
		JProblemDAO jpd = JProblemDAO.getInstance();
		JProblemDto jdto = jpd.select_num(p_no);
		model.addAttribute("jpro", jdto);

		return "jproblem";
	}

	@RequestMapping(value = "/problemCreate")
	public String getProblemCreate(Model model, HttpServletRequest request, HttpServletResponse reponse)
			throws Exception {
		model.addAttribute("problemDto", new ProblemDto());
		return "problemCreate";
	}

	@RequestMapping(value = "/jproblemCreate")
	public String getJProblemCreate(Model model, HttpServletRequest request, HttpServletResponse reponse)
			throws Exception {
		model.addAttribute("jproblemDto", new JProblemDto());
		return "jproblemCreate";
	}

	@RequestMapping(value = "/problemCreate.do")
	public String doProblemCreate(@ModelAttribute ProblemDto mem, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		System.out.println(mem.getP_title() + "??");
		ProblemDAO pa = ProblemDAO.getInstance();
		pa.insert_problem(mem);

		return "redirect:/sample/";
	}

	@RequestMapping(value = "/jproblemCreate.do")
	public String doJProblemCreate(@ModelAttribute JProblemDto mem, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		System.out.println(mem.getP_title() + "??");
		JProblemDAO jpa = JProblemDAO.getInstance();
		jpa.insert_problem(mem);

		return "redirect:/sample/";
	}

	@RequestMapping(value = "/tableCreate")
	public String getTableCreate(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		return "tableCreate";
	}

	@RequestMapping(value = "/tableCreate.do")
	public String doTableCreate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String str = request.getParameter("table_sql");
		System.out.println(str + "TableC");
		ProblemDAO pd = ProblemDAO.getInstance();
		pd.insert_table(str);
		return "redirect:/sample/";
	}

	@RequestMapping(value = "/problem.do")
	public String doProblem(Model model, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		HttpSession session = request.getSession();

		MemberDto md = (MemberDto) session.getAttribute("member");
		if (md == null) {
			return "redirect:/sample/login";
		}
		md.setSql(request.getParameter("sql"));
		String pnum = request.getParameter("pnum");
		// System.out.println(md.getId() +"," + md.getSql()+pnum);
		ProblemDAO pd = ProblemDAO.getInstance();
		ProblemDto pDto = pd.select_num(pnum);
		String[] sql_type = md.getSql().toUpperCase().split(" ");
		if (sql_type[0].equals("SELECT")) {
			System.out.println(pd.select_answer(md.getSql()));
			System.out.println(pd.select_answer(pDto.getP_answer()));

			SubmitLogDto sDto = new SubmitLogDto();
			sDto.setM_ID(md.getId());
			sDto.setProb_num(pnum);
			sDto.setSub_code(md.getSql());
			if (pd.select_answer(md.getSql()).equals(pd.select_answer(pDto.getP_answer()))) {
				sDto.setSub_answer("T");
				model.addAttribute("answer", "정답입니다.");
			} else {
				sDto.setSub_answer("F");
				model.addAttribute("answer", "틀렸습니다.");
			}
			SubmitLogDAO sd = SubmitLogDAO.getInstance();
			sd.insert(sDto);
		}
		return "problemResult";
	}

	@RequestMapping(value = "/jproblem.do")
	public String doJProblem(Model model, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		HttpSession session = request.getSession();

		MemberDto md = (MemberDto) session.getAttribute("member");
		if (md == null) {
			return "redirect:/sample/login";
		}
		md.setSql(request.getParameter("sql"));
		String pnum = request.getParameter("pnum");
		// System.out.println(md.getId() +"," + md.getSql()+pnum);
		JProblemDAO jpd = JProblemDAO.getInstance();
		JProblemDto jpDto = jpd.select_num(pnum);

		SubmitLogDto sDto = new SubmitLogDto();
		sDto.setM_ID(md.getId());
		sDto.setProb_num(pnum);
		sDto.setSub_code(md.getSql());
		System.out.println(md.getSql());
		if (jpd.java_answer(jpDto, md.getSql())) {
			sDto.setSub_answer("T");
			model.addAttribute("answer", "정답입니다.");
		} else {
			sDto.setSub_answer("F");
			model.addAttribute("answer", "틀렸습니다.");
		}

		SubmitLogDAO sd = SubmitLogDAO.getInstance();
		sd.insert(sDto);

		return "problemResult";
	}

	@RequestMapping(value = "/home")
	public String getHome(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		System.out.println("HOME");
		return "redirect:/sample/";
	}

	@RequestMapping(value = "/rank")
	public String getRank(Model model, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		MemberDAO md = MemberDAO.getInstance();
		ArrayList<MemberDto> list_ranking = md.ranking();
		// 맞은 문제 순으로 정렬하기.
		Collections.sort(list_ranking);

		model.addAttribute("list_ranking", list_ranking);
		return "rankPage";
	}

	@RequestMapping(value = "/logout.do")
	public String getLogout(HttpServletRequest request, HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/sample/";
	}

	@RequestMapping(value = "/questionlist")
	public String getQuestionList(Model model, HttpServletRequest request, HttpServletResponse reponse)
			throws Exception {
		List<QuestionDto> questionList = QuestionDAO.getInstance().selectAll();
		List<Integer> numOfCommentsList = new ArrayList<>();
		for (int i = 0; i < questionList.size(); i++) {
			int count = QuestionCommentDAO.getInstance().countComments(questionList.get(i).getM_id(),
					questionList.get(i).getProb_num(), questionList.get(i).getQst_date());
			numOfCommentsList.add(count);
		}

		model.addAttribute("questionList", questionList);
		model.addAttribute("numOfCommentsList", numOfCommentsList);
		return "question_list";
	}

	@RequestMapping(value = "/question")
	public String getQuestion(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		QuestionDto question = QuestionDAO.getInstance().selectQuestion(request.getParameter("m_id"),
				Integer.parseInt(request.getParameter("prob_num")), request.getParameter("qst_date"));
		List<QuestionCommentDto> comments = QuestionCommentDAO.getInstance().selectComments(
				request.getParameter("m_id"), Integer.parseInt(request.getParameter("prob_num")),
				request.getParameter("qst_date"));

		request.setAttribute("question", question);
		request.setAttribute("comments", comments);

		return "question";
	}

	@RequestMapping(value = "/question_update")
	public String updateQuestion(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		QuestionDto question = QuestionDAO.getInstance().selectQuestion(request.getParameter("m_id"),
				Integer.parseInt(request.getParameter("prob_num")), request.getParameter("qst_date"));

		request.setAttribute("question", question);

		return "questionUpdate";
	}

	@RequestMapping(value = "/updateQuestion.do")
	public String doUpdateQuestion(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		request.setCharacterEncoding("utf-8");
		QuestionDAO.getInstance().updateQuestion(request.getParameter("m_id"),
				Integer.parseInt(request.getParameter("prob_num")), request.getParameter("qst_date"),
				request.getParameter("qst_title"), request.getParameter("qst_body"));

		return "redirect:/sample/questionlist";
	}

	@RequestMapping(value = "/question_delete")
	public String deleteQuestion(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		QuestionDAO.getInstance().deleteQuestion(request.getParameter("m_id"),
				Integer.parseInt(request.getParameter("prob_num")), request.getParameter("qst_date"));

		return "redirect:/sample/questionlist";
	}

	@RequestMapping(value = "/askQuestion")
	public String askQuestion(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		List<ProblemDto> problemList = ProblemDAO.getInstance().select_all();
		request.setAttribute("problemList", problemList);
		return "questionInsert";
	}

	@RequestMapping(value = "/insertQuestion.do")
	public String doInsertQuestion(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		request.setCharacterEncoding("utf-8");
		QuestionDAO.getInstance().insertQuestion(request.getParameter("m_id"),
				Integer.parseInt(request.getParameter("prob_num")), request.getParameter("qst_title"),
				request.getParameter("qst_body"));

		return "redirect:/sample/questionlist";
	}

	@RequestMapping(value = "/insertComment.do")
	public String doInsertComment(Model model, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		QuestionCommentDAO.getInstance().insertComment(request.getParameter("q_id"), request.getParameter("qc_id"),
				Integer.parseInt(request.getParameter("prob_num")), request.getParameter("qst_date"),
				request.getParameter("qc_body"));
		model.addAttribute("commentList", QuestionCommentDAO.getInstance().selectComments(request.getParameter("q_id"),
				Integer.parseInt(request.getParameter("prob_num")), request.getParameter("qst_date")));

		return "commentList";
	}

	@RequestMapping(value = "/deleteComment.do")
	public String doDeleteComment(Model model, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		QuestionCommentDAO.getInstance().deleteComment(request.getParameter("q_id"), request.getParameter("qc_id"),
				Integer.parseInt(request.getParameter("prob_num")), request.getParameter("qst_date"),
				request.getParameter("qc_date"), request.getParameter("qc_body"));
		model.addAttribute("commentList", QuestionCommentDAO.getInstance().selectComments(request.getParameter("q_id"),
				Integer.parseInt(request.getParameter("prob_num")), request.getParameter("qst_date")));

		return "commentList";
	}

	@ResponseBody
	@RequestMapping(value = "/chat")
	public String doChat(ChatDto chat_data, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberDto md = (MemberDto) session.getAttribute("member");
		msg = chat_data.getContent();
		msg = "\n" + md.getId() + " = " + msg;
		System.out.println(msg);
		return msg;
	}

//	/produces = "application/text; charset=utf8" 한글깨짐 수정법, json 보낼떈 application/json;
	@ResponseBody
	@RequestMapping(value = "/getChat", produces = "application/text; charset=utf8")
	public String getChat(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		return msg;
	}

	@ResponseBody
	@RequestMapping(value = "/message")
	public String changeMessage(@RequestParam(value = "message") String str, HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
		MemberDto md = (MemberDto) session.getAttribute("member");
		MemberDAO.getInstance().update_message(md, str);
		System.out.println(str);
		return msg;
	}

}
