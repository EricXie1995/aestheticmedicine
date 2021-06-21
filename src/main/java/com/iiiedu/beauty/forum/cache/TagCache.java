package com.iiiedu.beauty.forum.cache;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.iiiedu.beauty.forum.dto.TagDto;

public class TagCache {
	
	public List<TagDto> gettags(){
        List<TagDto> tags=new ArrayList<>();

        TagDto language=new TagDto();
        language.setCategoryname("開發語言");
        language.setTags(Arrays.asList("java","c","c++","php","html","html5","css"));
        tags.add(language);

        TagDto tools=new TagDto();
        tools.setCategoryname("開發工具");
        tools.setTags(Arrays.asList("Spring","SpringBoot","SpringMVC"));
        tags.add(tools);

        return tags;
    }
}
