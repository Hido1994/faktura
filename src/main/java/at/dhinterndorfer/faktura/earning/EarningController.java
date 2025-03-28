package at.dhinterndorfer.faktura.earning;

import at.dhinterndorfer.faktura.dto.v1.EarningPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.EarningRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.page.PageableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class EarningController {
    private final PageableMapper pageableMapper;

    private final EarningService service;
    private final EarningMapper mapper;


    public EarningRestDto save(@NonNull EarningRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public EarningRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public EarningPageRestDto findAll(PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}