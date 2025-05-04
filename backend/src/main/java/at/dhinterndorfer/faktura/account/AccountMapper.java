package at.dhinterndorfer.faktura.account;

import at.dhinterndorfer.faktura.commons.filter.NullableMapper;
import at.dhinterndorfer.faktura.commons.filter.OperatorTupleMapper;
import at.dhinterndorfer.faktura.dto.v1.AccountFilterRestDto;
import at.dhinterndorfer.faktura.dto.v1.AccountPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.AccountRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper(uses = {NullableMapper.class, OperatorTupleMapper.class})
public interface AccountMapper {

    AccountRestDto mapToDto(Account entity);

    List<AccountRestDto> mapToDto(List<Account> entityList);

    Account mapToDbo(AccountRestDto entity);

    List<Account> mapToDbo(List<AccountRestDto> entityList);

    default AccountPageRestDto mapPage(Page<Account> page) {
        AccountPageRestDto pageRestDto = new AccountPageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }

    AccountSearchFilter mapFilter(AccountFilterRestDto entity);

}