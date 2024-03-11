package com.dietsite;

import com.dietsite.board.BoardService;
import com.dietsite.util.PageDTO;
import com.dietsite.visitorCount.VisitorCountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Controller
public class HomeController {

    @Autowired
    VisitorCountService visitorCountService;
    @Autowired
    BoardService boardService;

    String boardTitle1 = "tVsTBoard";
    String boardTitle2 = "zVsTBoard";
    String boardTitle3 = "pVsZBoard";

    @GetMapping("/")
    public String home(PageDTO page, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Cookie[] cookies = request.getCookies();
        boolean isVisitor = false;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("visitor".equals(cookie.getName())) {
                    isVisitor = true;
                    break;
                }
            }
        }

        if (!isVisitor) {
            createVisitorCookie(response);
            visitorCountService.incrementVisitorCount();
        }

        // 각 게시판별 최신글조회
        model.addAttribute("boardTitle1", boardTitle1);
        model.addAttribute("page1", boardService.pageSetting(boardTitle1, page));
        model.addAttribute("postList1", boardService.showPostList(boardTitle1, page));
        model.addAttribute("boardTitle2", boardTitle2);
        model.addAttribute("page2", boardService.pageSetting(boardTitle2, page));
        model.addAttribute("postList2", boardService.showPostList(boardTitle2, page));
        model.addAttribute("boardTitle3", boardTitle3);
        model.addAttribute("page3", boardService.pageSetting(boardTitle3, page));
        model.addAttribute("postList3", boardService.showPostList(boardTitle3, page));

        model.addAttribute("todayCount", visitorCountService.getTodayCount());
        model.addAttribute("totalCount", visitorCountService.getTotalCount());

        return "index";
    }
    private void createVisitorCookie(HttpServletResponse response) {
        Cookie visitorCookie = new Cookie("visitor", "true");

        // 오늘의 자정까지의 시간을 초 단위로 계산
        LocalDateTime midnight = LocalDateTime.of(LocalDate.now().plusDays(1), LocalTime.MIDNIGHT);
        int secondsUntilMidnight = (int) Duration.between(LocalDateTime.now(), midnight).getSeconds();

        visitorCookie.setMaxAge(secondsUntilMidnight); // 자정까지
        visitorCookie.setPath("/"); // 전체 도메인에서 유효
        response.addCookie(visitorCookie);
    }

    @GetMapping("/guidelines")
    public String showGuidelines() {
        return "guidelines";
    }

}