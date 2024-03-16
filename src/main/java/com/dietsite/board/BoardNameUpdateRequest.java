package com.dietsite.board;

import lombok.Data;

@Data
public class BoardNameUpdateRequest {
    private String boardTitle; // 변경하려는 게시판의 영문명
    private String newName;    // 새로운 한글명
}
