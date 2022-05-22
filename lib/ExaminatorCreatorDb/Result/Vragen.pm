use utf8;
package ExaminatorCreatorDb::Result::Vragen;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ExaminatorCreatorDb::Result::Vragen

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<vragen>

=cut

__PACKAGE__->table("vragen");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 tekst

  data_type: 'text'
  is_nullable: 0

=head2 juiste_antwoord

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 uitleg

  data_type: 'text'
  is_nullable: 1

=head2 categorie_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "tekst",
  { data_type => "text", is_nullable => 0 },
  "juiste_antwoord",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "uitleg",
  { data_type => "text", is_nullable => 1 },
  "categorie_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 antwoordens

Type: has_many

Related object: L<ExaminatorCreatorDb::Result::Antwoorden>

=cut

__PACKAGE__->has_many(
  "antwoordens",
  "ExaminatorCreatorDb::Result::Antwoorden",
  { "foreign.vraag_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 categorie

Type: belongs_to

Related object: L<ExaminatorCreatorDb::Result::Categorien>

=cut

__PACKAGE__->belongs_to(
  "categorie",
  "ExaminatorCreatorDb::Result::Categorien",
  { id => "categorie_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 juiste_antwoord

Type: belongs_to

Related object: L<ExaminatorCreatorDb::Result::Antwoorden>

=cut

__PACKAGE__->belongs_to(
  "juiste_antwoord",
  "ExaminatorCreatorDb::Result::Antwoorden",
  { id => "juiste_antwoord" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2022-05-13 06:42:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aq/kmFElgB1hVzXjHvIYvA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
