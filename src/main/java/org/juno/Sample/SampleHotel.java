package org.juno.Sample;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.ToString;

@Component
@ToString
@Getter
@AllArgsConstructor	//필드 자동 생성 or @RequiredArgsConstructor
public class SampleHotel {
	@NonNull
	private Chef chef;
//	public SampleHotel(Chef chef) {
//		this.chef = chef;
//	}
}