package com.dietsite.visitorCount;

public interface VisitorCountService {
    void incrementVisitorCount();
    int getTotalCount();
    int getTodayCount();
}
