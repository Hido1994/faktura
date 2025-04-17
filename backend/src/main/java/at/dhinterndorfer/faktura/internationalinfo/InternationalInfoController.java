package at.dhinterndorfer.faktura.internationalinfo;

import at.dhinterndorfer.faktura.commons.page.PageableMapper;
import at.dhinterndorfer.faktura.dto.v1.InternationalInfoFilterRestDto;
import at.dhinterndorfer.faktura.dto.v1.InternationalInfoPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.InternationalInfoRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class InternationalInfoController {
    private final PageableMapper pageableMapper;

    private final InternationalInfoService service;
    private final InternationalInfoMapper mapper;


    public InternationalInfoRestDto save(@NonNull InternationalInfoRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public InternationalInfoRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public InternationalInfoPageRestDto findAll(InternationalInfoFilterRestDto filter, PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(mapper.mapFilter(filter), pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}