package at.dhinterndorfer.faktura.timeentry;

import at.dhinterndorfer.faktura.dto.v1.TimeEntryPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.TimeEntryRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper
public interface TimeEntryMapper {

    TimeEntryRestDto mapToDto(TimeEntry entity);

    List<TimeEntryRestDto> mapToDto(List<TimeEntry> entityList);

    TimeEntry mapToDbo(TimeEntryRestDto entity);

    List<TimeEntry> mapToDbo(List<TimeEntryRestDto> entityList);

    default TimeEntryPageRestDto mapPage(Page<TimeEntry> page) {
        TimeEntryPageRestDto pageRestDto = new TimeEntryPageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }
}