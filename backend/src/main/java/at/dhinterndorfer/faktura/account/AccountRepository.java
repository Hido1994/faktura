package at.dhinterndorfer.faktura.account;

import com.querydsl.core.BooleanBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends JpaRepository<Account, Long>, QuerydslPredicateExecutor<Account> {
    default BooleanBuilder getDefaultFilterClause(@NonNull AccountSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QAccount qEntity = QAccount.account;
        filter.getDescription().ifPresent(x -> builder.and(qEntity.description.lower().contains(x.toLowerCase())));
        return builder;
    }
}