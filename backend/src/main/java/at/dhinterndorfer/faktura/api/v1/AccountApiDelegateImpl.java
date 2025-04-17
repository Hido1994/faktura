package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.account.AccountController;
import at.dhinterndorfer.faktura.dto.v1.AccountFilterRequestRestDto;
import at.dhinterndorfer.faktura.dto.v1.AccountPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.AccountRestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class AccountApiDelegateImpl implements AccountApiDelegate {
    private final AccountController accountController;

    @Override
    public ResponseEntity<Void> deleteAccount(Long id) {
        accountController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<AccountRestDto> getAccountById(Long id) {
        return ResponseEntity.ok(accountController.findById(id));
    }

    @Override
    public ResponseEntity<AccountPageRestDto> getAccounts(AccountFilterRequestRestDto accountFilterRequestRestDto) {
        return ResponseEntity.ok(accountController.findAll(accountFilterRequestRestDto.getFilter(),
            accountFilterRequestRestDto.getPageable()));
    }

    @Override
    public ResponseEntity<AccountRestDto> saveAccount(AccountRestDto accountRestDto) {
        return ResponseEntity.ok(accountController.save(accountRestDto));
    }
}
