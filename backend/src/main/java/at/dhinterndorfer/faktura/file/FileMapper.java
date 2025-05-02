package at.dhinterndorfer.faktura.file;

import at.dhinterndorfer.faktura.commons.date.DateTimeMapper;
import at.dhinterndorfer.faktura.commons.filter.NullableMapper;
import at.dhinterndorfer.faktura.dto.v1.FileFilterRestDto;
import at.dhinterndorfer.faktura.dto.v1.FilePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.FileRestDto;
import org.mapstruct.Mapper;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;

import java.io.IOException;
import java.util.List;

@Mapper(uses = {NullableMapper.class, DateTimeMapper.class})
public interface FileMapper {

    FileRestDto mapToDto(File entity);

    List<FileRestDto> mapToDto(List<File> entityList);

    File mapToDbo(FileRestDto entity);

    List<File> mapToDbo(List<FileRestDto> entityList);

    default FilePageRestDto mapPage(Page<File> page) {
        FilePageRestDto pageRestDto = new FilePageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }

    FileSearchFilter mapFilter(FileFilterRestDto entity);

    default Resource map(byte[] value) {
        return new ByteArrayResource(value);
    }

    default byte[] map(Resource value) throws IOException {
        return value.getContentAsByteArray();
    }
}