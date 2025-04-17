package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.dto.v1.*;
import at.dhinterndorfer.faktura.timeentry.TimeEntryController;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class TimeEntryApiDelegateImpl implements TimeEntryApiDelegate {
    private final TimeEntryController timeEntryController;

    @Override
    public ResponseEntity<Void> deleteTimeEntry(Long id) {
        timeEntryController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<TimeEntryRestDto> getTimeEntryById(Long id) {
        return ResponseEntity.ok(timeEntryController.findById(id));
    }
    
    @Override
    public ResponseEntity<TimeEntryPageRestDto> getTimeEntries(TimeEntryFilterRequestRestDto timeEntryFilterRequestRestDto) {
        return ResponseEntity.ok(timeEntryController.findAll(timeEntryFilterRequestRestDto.getFilter(),
            timeEntryFilterRequestRestDto.getPageable()));
    }

    @Override
    public ResponseEntity<TimeEntryRestDto> saveTimeEntry(TimeEntryRestDto timeEntryRestDto) {
        return ResponseEntity.ok(timeEntryController.save(timeEntryRestDto));
    }
}
