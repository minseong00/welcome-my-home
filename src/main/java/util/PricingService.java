package util;

import java.sql.Date;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;

public class PricingService {

    public double calculateDynamicPrice(int roomNo, Date checkIn, Date checkOut, double basePrice) {
        double dynamicPrice = basePrice;

        // 예약 기간 계산
        long duration = getDuration(checkIn, checkOut);

        // 주말에는 20% 가격 상승
        for (long i = 0; i < duration; i++) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new java.util.Date(checkIn.getTime()));
            calendar.add(Calendar.DAY_OF_MONTH, (int) i);
            Date currentDate = new Date(calendar.getTimeInMillis());

            if (isWeekend(currentDate)) {
                dynamicPrice += basePrice * 0.2;
            }

            if (isPeakSeason(currentDate)) {
                dynamicPrice += basePrice * 0.3;
            }
        }

        // 총 가격 계산
        double totalPrice = dynamicPrice * duration;
        return totalPrice;
    }

    private long getDuration(Date checkIn, Date checkOut) {
        long diffInMillies = Math.abs(checkOut.getTime() - checkIn.getTime());
        long duration = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
        return duration + 1; // 예약 기간에 마지막 날을 포함시키기 위해 +1을 더함 
    }

    private boolean isWeekend(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        return (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY);
    }

    private boolean isPeakSeason(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int month = calendar.get(Calendar.MONTH) + 1; // Calendar.MONTH는 0부터 시작하므로 1을 더함 
        int day = calendar.get(Calendar.DAY_OF_MONTH);

        // 여름 성수기 7월 1일 ~ 8월 31일? 
        if ((month == 7 || month == 8)) {
            return true;
        }

        // 연말연시 성수기 아마 이때 ?: 12월 20일 ~ 1월 5일
        if ((month == 12 && day >= 20) || (month == 1 && day <= 5)) {
            return true;
        }

        return false;
    }
}
