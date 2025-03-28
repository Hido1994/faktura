package at.dhinterndorfer.faktura.file;

import at.dhinterndorfer.faktura.dto.v1.FilePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.FileRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.page.PageableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class FileController {
    private final PageableMapper pageableMapper;

    private final FileService service;
    private final FileMapper mapper;


    public FileRestDto save(@NonNull FileRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public FileRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public FilePageRestDto findAll(PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}