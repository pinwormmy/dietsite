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

    @GetMapping("/")
    public String home(PageDTO page, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        checkAndCreateVisitorCookie(request, response);

        addBoardAttributesToModel(model, "board1", page);
        addBoardAttributesToModel(model, "board2", page);
        addBoardAttributesToModel(model, "board3", page);

        model.addAttribute("todayCount", visitorCountService.getTodayCount());
        model.addAttribute("totalCount", visitorCountService.getTotalCount());

        return "index";
    }

    private void addBoardAttributesToModel(Model model, String boardTitle, PageDTO page) throws Exception {
        String koreanTitle = boardService.getKoreanTitle(boardTitle);
        String boardNumber = boardTitle.substring(boardTitle.length() - 1);
        model.addAttribute("boardTitle" + boardNumber, boardTitle);
        model.addAttribute("koreanTitle" + boardNumber, koreanTitle);
        model.addAttribute("page" + boardNumber, boardService.pageSetting(boardTitle, page));
        model.addAttribute("postList" + boardNumber, boardService.showPostList(boardTitle, page));
    }


    private void checkAndCreateVisitorCookie(HttpServletRequest request, HttpServletResponse response) {
        boolean isVisitor = false;
        Cookie[] cookies = request.getCookies();

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
    }

    private void createVisitorCookie(HttpServletResponse response) {
        Cookie visitorCookie = new Cookie("visitor", "true");
        LocalDateTime midnight = LocalDateTime.of(LocalDate.now().plusDays(1), LocalTime.MIDNIGHT);
        int secondsUntilMidnight = (int) Duration.between(LocalDateTime.now(), midnight).getSeconds();

        visitorCookie.setMaxAge(secondsUntilMidnight);
        visitorCookie.setPath("/");
        response.addCookie(visitorCookie);
    }

    @GetMapping("/guidelines")
    public String showGuidelines() {
        return "guidelines";
    }
}
