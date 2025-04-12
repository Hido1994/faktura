package at.dhinterndorfer.faktura.account;

import at.dhinterndorfer.faktura.dto.v1.AccountPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.AccountRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.commons.page.PageableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class AccountController {
    private final PageableMapper pageableMapper;

    private final AccountService service;
    private final AccountMapper mapper;


    public AccountRestDto save(@NonNull AccountRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public AccountRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public AccountPageRestDto findAll(PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}