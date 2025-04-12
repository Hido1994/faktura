package at.dhinterndorfer.faktura.timeentry;

import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.dto.v1.TimeEntryPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.TimeEntryRestDto;
import at.dhinterndorfer.faktura.commons.page.PageableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class TimeEntryController {
    private final PageableMapper pageableMapper;

    private final TimeEntryService service;
    private final TimeEntryMapper mapper;


    public TimeEntryRestDto save(@NonNull TimeEntryRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public TimeEntryRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public TimeEntryPageRestDto findAll(PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}