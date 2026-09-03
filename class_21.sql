create table tb_person (
	person_id int auto_increment, 
    name varchar(50) not null,
    primary key (person_id)
); 

create table tb_passport (
	passport_id int auto_increment,
    passport_number varchar(20) not null,
    person_id int unique, -- 이 UNIQUE가 1:1 관계를 만들어준다. UNIQUE 없으면 1:N 관계가 되는 것이다.
    primary key(passport_id),
    foreign key(person_id) references tb_person(person_id)
    );
    
    insert into tb_person (name) values
    ('홍길동'),
    ('김영희'),
    ('이철수');
    
    insert into tb_passport (passport_number, person_id) values
    ('p123', 1),
    ('p456', 2),
    ('p789', 3);
    
    select * from tb_person;
    select * from tb_passport;
    
    -- join으로 검색하기
    select p.*, t.passport_number
    from tb_person p
    inner join tb_passport t
    on t.person_id = p.person_id;
    
    -- join으로 검색하기
    -- 같은 것이 하나도 없기 때문에 아무 튜블도 검색되지 않는다.
    select p.*, t.passport_number
    from tb_person p
    inner join tb_passport t
    on p.name = t.passport_number;
    
     
    