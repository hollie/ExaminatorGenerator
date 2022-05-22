use utf8;
package ExaminatorCreatorDb::Result::Antwoorden;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ExaminatorCreatorDb::Result::Antwoorden

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<antwoorden>

=cut

__PACKAGE__->table("antwoorden");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 tekst

  data_type: 'text'
  is_nullable: 1

=head2 vraag_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "tekst",
  { data_type => "text", is_nullable => 1 },
  "vraag_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 vraag

Type: belongs_to

Related object: L<ExaminatorCreatorDb::Result::Vragen>

=cut

__PACKAGE__->belongs_to(
  "vraag",
  "ExaminatorCreatorDb::Result::Vragen",
  { id => "vraag_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 vragens

Type: has_many

Related object: L<ExaminatorCreatorDb::Result::Vragen>

=cut

__PACKAGE__->has_many(
  "vragens",
  "ExaminatorCreatorDb::Result::Vragen",
  { "foreign.juiste_antwoord" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2022-05-13 06:42:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0fa5na9h2akBsh22Y3bpYg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
